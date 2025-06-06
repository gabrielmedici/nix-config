{pkgs, ...}: {
  imports = [
    ./nil.nix
  ];

  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide

          ms-python.python
          rust-lang.rust-analyzer
          
          usernamehw.errorlens
        ];
        userSettings = {
          "editor.fontFamily" = "JetBrainsMono Nerd Font, Fira Code, Tinos, monospace";
          "editor.wordWrap" = "on";
        };
      };
    };   
  };
}