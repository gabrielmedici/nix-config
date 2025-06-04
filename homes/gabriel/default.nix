{inputs, pkgs, ...}:{
  users.users.gabriel = {
    isNormalUser = true;
    description = "gabriel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      gabriel = import ./home.nix;
    };
  };
}