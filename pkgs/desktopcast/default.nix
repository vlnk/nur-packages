{ lib, fetchFromGitHub, rustPlatform, pkg-config, glib, gst_all_1 }:

rustPlatform.buildRustPackage rec {
  pname = "desktopcast";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "seijikun";
    repo = pname;
    rev = "master";
    hash = "sha256-DiHw0pr/7Wpc5LIDxSv+4nOUkgLVNWZ49cwGgTfpVFI=";
  };

  cargoHash = "";

  cargoLock = {
    lockFile = ./Cargo.lock;

    outputHashes = {
      "gst-plugin-version-helper-0.11.0-alpha.1" = "sha256-cAkroRQSTLht/CPtT3EiNmF6GIre4BN2hWLRGDwQL80=";
      "upnp-client-0.1.8" = "sha256-wpTyZv0A4L+gWY7D5o08aRjwA33gbA4vWSJGy+vm6Nk=";
    };
  };

  PKG_CONFIG_PATH = "$PKG_CONFIG_PATH:${glib.dev}/lib/pkgconfig/";

  buildInputs = with gst_all_1; [
    gstreamer
    gst-plugins-good
    gst-plugins-base
    gst-rtsp-server
  ];

  nativeBuildInputs = [
    glib.dev
    pkg-config
  ];

  meta = with lib; {
    description = "CLI utility that screencaptures your Linux desktop and streams it to Kodi via UPNP/DLNA and RTSP";
    homepage = "https://github.com/seijikun/desktopcast";
    license = licenses.asl20;
    maintainers = with maintainers; [ vlnk ];
    platforms = platforms.unix;
  };
}
