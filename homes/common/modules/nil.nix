{ pkgs, config, libs, ...}:
{
  # Nix LSP
  home.packages = [
    pkgs.nil
    pkgs.nixfmt-rfc-style
  ];
}