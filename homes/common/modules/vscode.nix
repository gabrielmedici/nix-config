{pkgs, ...}: {
  imports = [
    ./nil.nix
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      mkhl.direnv

      ms-python.python
      rust-lang.rust-analyzer
      
      usernamehw.errorlens
    ];
  };
}