{inputs, pkgs, ...}: 
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  nixpkgs.config.allowUnfree = true;

  programs.spicetify = {
    enable = true;

    theme = spicePkgs.themes.lucid;
  };
}