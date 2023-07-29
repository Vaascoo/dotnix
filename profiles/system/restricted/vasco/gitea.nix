{ pkgs, ... }:

{
  services.gitea = {
    enable = true;
    settings = {
      session.COOKIE_SECURE = true;
      server.SSH_PORT = 22;
    };
    httpPort = 3000;
    httpAddress = "127.0.0.1";
    domain = "raft.vaascoo.pt";
    rootUrl = "https://git.vaascoo.pt";
  };
}
