let
  vasco = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOhkfgFv8yH7Td4QMadLFDCgMrXpI7QQaMNBM2YeN/+k";
  raft = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMqYSdBgEOBpoB0eioYuCBiSN/OVlK4xX7dmJ6P9an9F";
in
{
  "wireguard.age".publicKeys = [ vasco ];
  "runner.age".publicKeys = [ vasco raft ];
}
