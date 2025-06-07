{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [
      pkgs.rofi-power-menu
    ];
    extraConfig = {
      modes = "drun,combi,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
    };
  };
}