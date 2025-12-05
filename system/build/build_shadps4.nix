{
  description = "shadPS4 packaging flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11"; # pick your preferred channel
    # fetch the GitHub repo as a flake input (this will be recorded in flake.lock)
    shad = {
      url = "github:shadps4-emu/shadPS4";
      # optional: you can pin to a specific tag/commit here by using "github:owner/repo/ref"
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, shad, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.shadps4 = pkgs.stdenv.mkDerivation {
          pname = "shadps4";
          # version is the upstream commit-ish recorded in flake.lock for input "shad"
          version = (builtins.substring 0 12 shad.rev) or "git";

          src = pkgs.fetchFromGitHub {
            owner = "shadps4-emu";
            repo = "shadPS4";
            # use the revision provided by the flake input (so flake.lock -> reproducible)
            rev = shad.rev;
            # supply sha256 from `nix-prefetch-url` after first fetch (see instructions below)
            sha256 = "0000000000000000000000000000000000000000000000000000";
          };

          nativeBuildInputs = with pkgs; [
            cmake ninja pkg-config make gcc
            # add any build deps you need; example below
            boost boost167 fmt spdlog vulkan-loader glfw sdl2 zlib
          ];

          # if upstream uses out-of-tree build with cmake
          cmakeFlags = [
            "-DCMAKE_BUILD_TYPE=Release"
            "-DENABLE_SOME_OPTION=ON" # adapt to upstream options if needed
          ];

          buildPhase = ''
            mkdir -p build
            cd build
            cmake .. -G Ninja ${lib.concatStringsSep " " cmakeFlags}
            ninja
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp build/shadPS4 $out/bin/
            # adjust binary path if different
          '';

          meta = with pkgs.lib; {
            description = "shadPS4 emulator (built from GitHub)";
            license = licenses.gpl2;
            homepage = "https://github.com/shadps4-emu/shadPS4";
            maintainers = with maintainers; [ ];
          };
        };

        # expose a defaultPackage to make `nix build .#shadps4` work
        defaultPackage = packages.shadps4;
      });
}