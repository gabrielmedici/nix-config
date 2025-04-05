{pkgs, ...}:{
  # services.onedrive.enable = true;

  home.packages = [
    pkgs.onedrive
    pkgs.onedrivegui
  ];
}