{pkgs, ...}: {
  home.packages = with pkgs; [
    astroterm
  ];
}