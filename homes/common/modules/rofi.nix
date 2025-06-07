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
    ];
    extraConfig = {
      modes = "drun,combi,power-menu:my-rofi-power-menu";
    };
  };
}