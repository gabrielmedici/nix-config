{config, pkgs, ...}:
{
    # https://nixos.wiki/wiki/Chromium#Enabling_native_Wayland_support
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    environment.systemPackages = with pkgs; [
        (microsoft-edge.override {
            commandLineArgs = [
                "--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
                "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport"
                "--enable-features=UseMultiPlaneFormatForHardwareVideo"
                "--ignore-gpu-blocklist"
                "--enable-zero-copy"
            ];
        })
    ];
}