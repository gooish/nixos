{
  lib,
  stdenv,
  fetchFromGitHub,
  buildGoModule,
  mpv,
  pkg-config
}:

let
  version = "0.0.5";
  pname = "stmps";
  commit = "3748452234fb305f5c1c46501833723156a964e3";
  hash = "sha256-yR2foOt6sDShaLQ1dB4S9ni5sseItHxKBwTVvE5Em6g=";
in

buildGoModule {
  inherit pname;
  inherit version;

  src = fetchFromGitHub {
    owner = "spezifisch";
    repo = "stmps";
    rev = "${commit}";
    hash = "${hash}";
  };

  buildInputs = [
    mpv
    pkg-config
  ];

  ldflags = [
    "-s" "-w"
    "-X main.Version=${version}"
    "-X main.Commit=${version}"
    "-L ${mpv}/lib"
  ];

  vendorHash = "sha256-nQ+njG45mYJ6lkGPOsEe+ob4EXvIoJ2d+cFXZSM3Lls=";

  meta = with lib; {
    homepage = "https://github.com/spezifisch/stmps";
    description = "Stmps is a terminal client for *sonic music servers, inspired by ncmpcpp and musickube written in GO.";
    license = licenses.gpl3Plus;
    maintainers = [ ];
    platforms = [
      "x86_64-linux"
      "aarch64-darwin"
    ];
  };
}