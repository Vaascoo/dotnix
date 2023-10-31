{pkgs, ...}: {
  programs.git = {
    enable = true;
    userEmail = "vcvasco1@gmail.com";
    userName = "Vaascoo";
    extraConfig = {
      color.ui = true;
      pull.rebase = true;
      init.defaultBranch = "main";
      url."git@github.com".pushinsteadOf = "https://github.com";
      gpg.format = "ssh";
    };

    includes = [
      {
        condition = "gitdir:~/Documents/Programming/gitlab.rnl.tecnico.ulisboa.pt/";
        contents = {
          user.email = "vasco.correia@rnl.tecnico.ulisboa.pt";
          user.name = "Vasco Correia";
          user.signingkey = "~/.ssh/id_ed25519_sign.pub";
          commit.sign = "true";
        };
      }
      {
        condition = "gitdir:~/Documents/Programming/github.com/";
        contents = {
          user.email = "vasco.correia@rnl.tecnico.ulisboa.pt";
          user.name = "Vaascoo";
          user.signingkey = "~/.ssh/id_ed25519_sign.pub";
          commit.sign = "true";
        };
      }
    ];
  };
}
