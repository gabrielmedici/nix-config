{inputs, ...}:{
  users.users.gabriel = {
    isNormalUser = true;
    description = "gabriel";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      gabriel = import ./home.nix;
    };
  };
}