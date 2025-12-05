{
  description = "Nix flake with shadPS4 pinned to commit 5183cbe6";

  outputs = { self, nixpkgs, ... }: {
    overlays.default = final: prev: {
      shadps4 = prev.shadps4.overrideAttrs (old: rec {
        pname = "shadps4";
        version = "git-5183cbe";

        src = prev.fetchFromGitHub {
          owner = "shadPS4";
          repo  = "shadPS4";
          rev   = "5183cbe6867c241e75632afbfe6ea3438fcf1316";
          sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
        };
      });
    };

    packages.x86_64-linux = let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ self.overlays.default ];
      };
    in {
      shadps4 = pkgs.shadps4;
    };
  };
}