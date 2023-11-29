{ lib
, stdenv
, fetchFromGitHub
, chicken
, chickenPackages_5
, sqlite
}:

stdenv.mkDerivation rec {
  version = "0.2.0-alpha2";
  name = "bintracker";
  pname = "${name}-${version}";

  src = fetchFromGitHub rec {
    owner = "${name}";
    repo = "${name}";
    rev = "v${version}";
    sha256 = "ULFNFbIFaz4Oo7RWoBRm606dGGsv+bhWMFewsB8cATA=";
  };

  buildInputs = [
    sqlite
    chicken
  ] ++ (with chickenPackages_5.chickenEggs; [
    args
    base64
    bitstring
    lazy-seq
    comparse
    coops
    list-utils
    matchable
    pstk
    s11n
    simple-md5
    sqlite3
    stb-image
    stb-image-write
    srfi-1
    srfi-4-comprehensions
    srfi-13
    srfi-14
    srfi-18
    srfi-69
    stack
    test
    typed-records
    web-colors
  ]);

  meta = with lib; {
    description = "A hackable Chiptune Audio Workstation.";
    license = licenses.mit;
    maintainers = with maintainers; [ vlnk ];
    platforms = platforms.unix;
  };
}
