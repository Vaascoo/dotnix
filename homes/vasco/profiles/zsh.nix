{pkgs, ...}: {
  home.sessionVariables.MANPAGER = "nvim +Man!";

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = ["--cmd cd"];
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat.enable = true;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      hostname = {
        ssh_only = false;
        format = "[@](yellow)[$hostname](bold blue) ";
      };
      username = {
        show_always = true;
        format = "[$user](red)";
      };
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "docker" "systemd" "aws" "gcloud" "kubectl"];
    };
    envExtra = ''
      ENABLE_CORRECTION="true"
    '';
    initContent = ''
            source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh

            export PATH=$HOME/.config/emacs/bin:$PATH

            evince() {
              if [[ $@ > 0 ]]; then
                ${pkgs.evince}/bin/evince $1 &>> /dev/null & disown
              else
                ${pkgs.evince}/bin/envice &>> /dev/null & disown
              fi
            }
            bindkey -v


      if [[ $- == *i* ]] && [[ ! "$0" =~ "login" ]]; then
          exec fish
      fi
    '';
    shellAliases = {
      l = "ls -algh";
      ssh = "TERM=xterm-256color ssh";
      less = "bat --style=plain";
      S = "exec $SHELL";
      tf = "terraform";
      k = "kubectl";
      open = "xdg-open";
      ignore = "${pkgs.git-ignore}/bin/git-ignore $(${pkgs.git-ignore}/bin/git-ignore -l 2> /dev/null | ${pkgs.fzf}/bin/fzf -m)";
    };

    # plugins = [ pkgs.nix-zsh-completions ];
  };
}
