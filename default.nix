let
  pkgs = import <nixpkgs> {};
in

pkgs.stdenv.mkDerivation rec {
  pname = "asls";
  version = "0.4.2";

  src = pkgs.fetchurl {
    url = "https://github.com/saulecabrera/asls/releases/download/v${version}/bin.tar.gz";
    sha256 = "14dcms0xl6dncwf16vixvf7rq7g15iwq8h4vja0dsiisyfm08aks";
  };

  buildInputs = [ pkgs.erlangR22 ];
  installPhase = "install -Dm755 -t $out/bin asls";

  meta = with pkgs.stdenv.lib; {
    description = "AssemblyScript Language Server";
    homepage = "https://github.com/saulecabrera/asls";
  };
}
