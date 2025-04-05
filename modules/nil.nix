{ pkgs, config, libs, ...}:
{
  # Nix LSP
  environment.systemPackages = [
    pkgs.nil
    pkgs.nixfmt-rfc-style
  ];
}