{ lib, fetchFromGitHub, rustPlatform, pkg-config, glib, gst_all_1 }:

rustPlatform.buildRustPackage rec {
  pname = "fountain-rs";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "adamchalmers";
    repo = pname;
    rev = "master";
    hash = "sha256-nKc593GGFHLQ20RJyFgOoo63AkxcmrlnUD7x3lEP+ZQ=";
  };

  cargoHash = "sha256-wEGbDwgNhTM/yrGpNdTylHPM5OZ54tEOtoG8MVcpIJk=";

  meta = with lib; {
    description = "Parser for Fountain markup, written in Rust";
    homepage = "https://github.com/adamchalmers/fountain-rs";
    license = licenses.unlicense;
    maintainers = with maintainers; [ vlnk ];
    platforms = platforms.unix;
  };
}
