let
  vasco = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOhkfgFv8yH7Td4QMadLFDCgMrXpI7QQaMNBM2YeN/+k";
in
{
  "wireguard.age".publicKeys = [ vasco ];
}
