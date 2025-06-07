{config, ...}: 
let
  syncthingDirectory = "${config.home.homeDirectory}/Syncthing";
in {
  xdg.userDirs.extraConfig = {
    XDG_SYNCTHING_DIR = syncthingDirectory;
  };
  services.syncthing = {
    enable = true;
    tray = true;
    settings = {
      gui = {
        username = "gabriel";
        password = "123321";
      };
      folders = {
        "${syncthingDirectory}" = {
          enable = true;
        };
      };
    };
  };
}