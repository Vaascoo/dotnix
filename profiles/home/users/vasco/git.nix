{ pkgs, ... }:
{

  programs.git = {
    enable = true;
    userEmail = "vcvasco1@gmail.com";
    userName = "Vaascoo";
    extraConfig = {
      color.ui = true;
      pull.rebase = true;
      init.defaultBranch = "main";
      url."git@github.com".pushinsteadOf = "https://github.com";
    };

    includes = [
      {
        condition = "gitdir:~/Documents/Programming/gitlab.rnl.tecnico.ulisboa.pt/";
        contents = {
          user.email = "vasco.correia@rnl.tecnico.ulisboa.pt";
          user.name = "Vasco Correia";
        };
      }
      {
        condition = "gitdir:~/Documents/Programming/github.com/";
        contents = {
          user.email = "vasco.correia@rnl.tecnico.ulisboa.pt";
          user.name = "Vaascoo";
        };
      }
    ];
  };
}
