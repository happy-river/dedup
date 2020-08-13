{ pkgs ? (import (import ./pinned-nixpkgs.nix) { })}:
with pkgs;
let
  tree-sitter-nix = fetchFromGitHub {
    owner = "cstrahan";
    repo = "tree-sitter-nix";
    rev = "791b5ff0e4f0da358cbb941788b78d436a2ca621";
    sha256 = "1y5b3wh3fcmbgq8r2i97likzfp1zp02m58zacw5a1cjqs5raqz66";
  };
  nix-parser = writeScriptBin "nix-parser" ''
    cd ${tree-sitter-nix}
    ${tree-sitter}/bin/tree-sitter parse $1
  '';
in stdenv.mkDerivation {
  pname = "count-nix-dups";
  src = ./.;
  version = "0.0.1";
  nativeBuildInputs = [ makeWrapper ];
  propagatedBuildInputs = [ tree-sitter nix-parser lispPackages.uiop ];
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/bin
    cp count-nix-dups.lisp $out/bin
    chmod +x $out/bin/count-nix-dups.lisp
    wrapProgram $out/bin/count-nix-dups.lisp --prefix PATH : ${lib.makeBinPath [ nix-parser ]}
  '';
}
