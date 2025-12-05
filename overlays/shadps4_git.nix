self: super: {
  shadps4-git = super.shadps4-git.overrideAttrs (oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs or [] ++ [
      super.xorg.libxcb
      super.xorg.libX11
    ];
  });
}