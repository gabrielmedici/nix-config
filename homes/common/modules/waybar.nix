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
          "tray"
          "custom/separator"
          "pulseaudio"
          "custom/separator"
          "backlight"
          "custom/separator"
          "battery"
          "custom/separator"
          "power-profiles-daemon"
          "custom/separator"
          "network"
          "custom/separator"
          "temperature#cpu"
          # the gpu and cpu are in the same sock.
          #  "temperature#gpu"
        ];

        "temperature#cpu" = {
          "hwmon-path" = "/sys/class/hwmon5/temp1_input";
          format = "{icon} {temperatureC}°C";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-icons = {
            default = "󰕾";
          };
          reverse-scrolling = true;
          interval = 1;
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = {
            default = "󰃟";
          };
          reverse-scrolling = true;
        };

        clock = {
          format = "{:%A, %B %d, %Y - %R}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        network = {
          format-disconnected = "{icon} N/A";
          format-wifi = "{icon}";
          tooltip-format-wifi = "{essid} ({ipaddr}/{cidr})\n{frequency}GHz {signalStrength}% {bandwidthTotalBytes}";
          format-ethernet = "{icon}";
          tooltip-format-ethernet = "{ipaddr}/{cidr} {bandwidthTotalBytes}Mbps";
          format-icons = {
            disconnected = "󰌙";
            wifi = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            ethernet = "󰈀";
          };
          interval = 10;
        };
        #"temperature#gpu" = {
        #  "hwmon-path" = "/sys/class/hwmon5/temp2_input";
        #};

        "custom/separator" = {
          format = "  |  ";
          interval = 1;
          tooltip = "Separator";
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          format-icons = {
            performance = "󰓅";
            balanced = "󰾅";
            power-saver = "󰾆";
          };
        };

        "battery" = {
          format = "{icon} {capacity}%";
          #tooltip-format = "{icon} {capacity}%\n{timeToFull} to full\n{timeToEmpty} remaining. \n{status}\nPower Draw {power}W";
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
