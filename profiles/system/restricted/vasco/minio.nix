{config, ...}: {
  services.minio = {
    enable = true;
    listenAddress = "0.0.0.0:9000";
    consoleAddress = "0.0.0.0:9001";
    secretKey = "password";
    accessKey = config.services.minio.secretKey;
  };
}
