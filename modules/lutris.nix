{ pkgs, ... }:
{
  imports = [
    ./protonup-qt.nix
    ./wine.nix
  ];

  environment.systemPackages = with pkgs; [
    lutris
  ];
}
