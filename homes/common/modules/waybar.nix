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
          "custom/separator"
          "network"
          "custom/separator"
          "temperature#cpu"
          # the gpu and cpu are in the same sock.
          #  "temperature#gpu"
        ];

        "temperature#cpu" = {
          "hwmon-path" = "/sys/class/hwmon5/temp1_input";
          format = "{icon}{temperatureC}°C";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        network = {
          format-disconnected = "{icon} N/A";
          format-wifi = "{icon}{essid} {signalStrength}%";
          tooltip-format-wifi = "{essid} ({ipaddr}/{cidr})\n{frequency}GHz {signalStrength}% {bandwidthTotalBytes}";
          format-ethernet = "{icon}{ipaddr}/{cidr}";
          tooltip-format-ethernet = "{ipaddr}/{cidr} {bandwidthTotalBytes}Mbps";
          format-icons = {
            disconnected = "󰌙";
            wifi = "󰤨";
            ethernet = "󰈀";
          };
          interval = 10;
        };
        #"temperature#gpu" = {
        #  "hwmon-path" = "/sys/class/hwmon5/temp2_input";
        #};

        "custom/separator" = {
          format = " | ";
          interval = 1;
          tooltip = "Separator";
        };

        "battery" = {
          format = "{icon}{capacity}% - 󱐋{power}W";
          format-icons = {
            charging = [
              "󰢟"
              "󰢜"
              "󰂆"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            default = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          interval = 30;
          states = {
            warning = 25;
            critical = 10;
          };
        };
      }
    ];
  };
}
