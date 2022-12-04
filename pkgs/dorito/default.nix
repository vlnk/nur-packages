{ lib, stdenv, fetchgit, ninja, cmake, pkg-config }:

stdenv.mkDerivation rec {
  pname = "dorito";
  version = "0.5.0";

  src = fetchgit rec {
    url = "https://github.com/lesharris/dorito";
    fetchSubmodules = true;
    rev = "${version}";
    sha256 = "wvVqvfMP4KTMpu1pAePzJIzUEQyx8GJjXqJxjVysWzc=";
  };

  nativeBuildInputs = [ cmake ninja pkg-config ];
  cmakeFlags = [ "-G Ninja" ];

  meta = with lib; {
    description = "A Dev Environment for Chip8, SuperChip, and XO-Chip";
    license = licenses.unlicense;
    maintainers = with maintainers; [ maintainers.vlnk ];
    platforms = platforms.unix;
  };
}
