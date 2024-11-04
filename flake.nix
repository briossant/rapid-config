{
  description = "rapid config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      darkmode = false;
      defaultUser = "xavier.login"; # PUT YOUR USERNAME HERE
    in
    let
      system = "x86_64-linux";
      globalVars = {
        inherit darkmode;
        inherit defaultUser;
      };
      pkgs = import nixpkgs { inherit system; };
    in
    let
      mkHome = { modules }: (
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          inherit modules;
          extraSpecialArgs = { inherit inputs; inherit globalVars; };
        }
      );
    in
    {
      homeConfigurations = {
        vim = mkHome {
          modules = [
            ./users/briossant/home.nix
          ];
        };
      };
    };
}
