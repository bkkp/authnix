{ pkgs }:
pkgs.writeScriptBin "authnix" ''
  export PATH="$PATH:${pkgs.lib.makeBinPath (with pkgs; [ nix coreutils bash sudo ])}"
  ${./authnix.sh} $@
''
