{config, pkgs, ...}:
{
    # https://nixos.wiki/wiki/Chromium#Enabling_native_Wayland_support
    # environment.sessionVariables.NIXOS_OZONE_WL = "1";
    # environment.systemPackages = with pkgs; [
    #     microsoft-edge
    # ];

    # some bitchass thought it was a good idea to remove edge from the nix repositories...
    programs.firefox.enable=true;
}