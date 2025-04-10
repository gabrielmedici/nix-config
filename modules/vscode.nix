{ pkgs, config, libs, ... }:
{
    imports = [
        ./nil.nix
    ];

    environment.systemPackages = with pkgs; [
        (vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions; [
                jnoortheen.nix-ide
                mkhl.direnv
                
                ms-python.python
                rust-lang.rust-analyzer
                
                usernamehw.errorlens
            ];
        })
    ];
}