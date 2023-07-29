{ config, pkgs, ... }:
{
  security.acme = {
    acceptTerms = true;
    defaults.email = "vcvasco1@gmail.com";

    certs."vaascoo.pt" = {
      domain = "vaascoo.pt";
      extraDomainNames = [ "*.vaascoo.pt" ];
      dnsProvider = "ovh";
      dnsPropagationCheck = true;
      credentialsFile = config.age.secrets.ovhCreds.path;
    };
  };
}
