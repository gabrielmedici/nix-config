{ pkgs, ... }:
{
  imports = [
    ./protonup-qt.nix
  ];

  environment.systemPackages = with pkgs; [
    lutris
  ];
}
