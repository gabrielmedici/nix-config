{ pkgs, config, libs, ... }:
{
    imports = [
        ./nil.nix
    ];

    environment.systemPackages = with pkgs; [
        (vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions; [
                jnoortheen.nix-ide
                arrterian.nix-env-selector
                
                ms-python.python
                rust-lang.rust-analyzer
                
                usernamehw.errorlens
            ];
        })
    ];
}