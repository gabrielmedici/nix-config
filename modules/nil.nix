{ pkgs, config, libs, ...}:
{
  environment.systemPackages = [
    pkgs.nil
    pkgs.nixfmt-rfc-style
  ];
}