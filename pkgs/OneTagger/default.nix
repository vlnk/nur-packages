{ lib, stdenv, fetchFromGitHub, rustPlatform, nodejs, pnpm_9 }:

rustPlatform.buildRustPackage rec {
  pname = "OneTagger";
  version = "1.7.0";

  src = fetchFromGitHub {
    owner = "Marekkon5";
    repo = pname;
    rev = version;
    hash = "";
  };

  pnpmDeps = pnpm_9.fetchDeps {
    inherit pname version src;
    hash = "";
    sourceRoot = "${src.name}/client";
  };

  cargoHash = "";

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  meta = with lib; {
    description = "Music tagger for Windows, MacOS and Linux with Beatport, Discogs, Musicbrainz, Spotify, Traxsource and many other platforms support.";
    homepage = "https://onetagger.github.io/";
    license = licenses.gplv3;
    maintainers = with maintainers; [ vlnk ];
    platforms = platforms.unix;
  };
}
