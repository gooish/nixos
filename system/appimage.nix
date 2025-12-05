programs.appimage = {
  enable = true;
  binfmt = true; # Enables direct execution (./appimage.AppImage)
};
# If FUSE is needed (many appimages use it):
boot.kernelModules = [ "fuse" ]; # 