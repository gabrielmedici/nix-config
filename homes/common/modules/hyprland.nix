{config, pkgs, ... }: 
{
  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = false;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
  };
}