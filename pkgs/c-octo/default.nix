{ lib, stdenv, fetchgit, clang, SDL2 }:

stdenv.mkDerivation rec {
  pname = "c-octo";
  version = "22.8.3";

  src = fetchgit rec {
    url = "https://github.com/JohnEarnest/c-octo";
    rev = "46cd9d913a957bef6cb959152992bf33f135839b";
    sha256 = "EXH+O1Wskn7rKIGZwuNeoxcXH3HABJhI2nHiJ0epzI4=";
  };

  nativeBuildInputs = [ clang ];
  buildInputs = [ SDL2 ];

  NIX_CFLAGS_COMPILE = "-Wno-error=unused-result";
  makeFlags = [
    "PREFIX=$(out)"
    "HOME=$(out)"
  ];

  configurePhase = ''
    mkdir -p $out/bin
  '';

  meta = with lib; {
    description = "A C rewrite of the Octo CHIP-8 IDE";
    license = licenses.mit;
    maintainers = with maintainers; [ maintainers.vlnk ];
    platforms = platforms.unix;
  };
}
