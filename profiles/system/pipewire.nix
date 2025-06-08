{lib, ...}: {
  services.pulseaudio.enable = lib.mkDefault false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
