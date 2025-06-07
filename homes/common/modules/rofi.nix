{pkgs, ...}: 
let 
  script = pkgs.writeShellScriptBin "my-rofi-power-menu" (builtins.readFile ../scripts/my-rofi-power-menu.sh);
in
{
  home.packages = with pkgs; [
    script
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [
      pkgs.rofi-power-menu
      pkgs.rofi-calc
    ];
    extraConfig = {
      modes = "drun,combi,calc,power-menu:my-rofi-power-menu";
    };
  };
}