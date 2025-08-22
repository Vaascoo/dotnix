{...}: {
  programs.git = {
    enable = true;
    userEmail = "vcvasco1@gmail.com";
    userName = "vaascoo";
    extraConfig = {
      color.ui = true;
      pull.rebase = true;
      init.defaultBranch = "main";
      url."git@github.com".pushinsteadOf = "https://github.com";
      gpg.format = "ssh";
      commit.sign = "true";
      commit.gpgsign = "true";
      user.signingkey = "~/.ssh/id_ed25519_sign.pub";
    };
  };
}
