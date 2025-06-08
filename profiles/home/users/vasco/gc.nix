{lib, ...}: let
  gcOptions = {
    automatic = true;
    options = "-d";
    frequency = "weekly";
    randomizedDelaySec = "4h";
  };
in {
  nix.gc = gcOptions;
}
