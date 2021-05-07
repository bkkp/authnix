{
  description = "Authnix give nix access to private github repos";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-20.09-small";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
  };

  outputs = { self, nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forEachSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
    in
    {

      overlay = final: prev: {
        authnix = prev.callPackage ./authnix.nix { };
      };

      defaultPackage = forEachSystem (system: (import nixpkgs {
        inherit system;
        overlays = [ self.overlay ];
      }).authnix);

      checks = forEachSystem (system: {
        build = self.defaultPackage.${system};
      });

    };

}
