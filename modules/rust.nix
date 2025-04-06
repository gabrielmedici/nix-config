{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.cargo
    pkgs.rustc
    # lld
    pkgs.llvmPackages.bintools
  ];
}