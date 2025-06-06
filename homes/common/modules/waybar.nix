{ ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ../config/waybar.css;

    settings = [
      {
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "battery"
          "temperature#cpu"
        # the gpu and cpu are in the same sock.
        #  "temperature#gpu"
        ];

        "temperature#cpu" = {
          "hwmon-path" = "/sys/class/hwmon5/temp1_input";
        };
        #"temperature#gpu" = {
        #  "hwmon-path" = "/sys/class/hwmon5/temp2_input";
        #};
      }
    ];
  };
}
