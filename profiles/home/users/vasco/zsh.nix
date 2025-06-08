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
    '';
    shellAliases = {
      l = "ls -algh";
      ssh = "TERM=xterm-256color ssh";
      less = "bat --style=plain";
      xcopy = "xclip -i -selection clipboard";
      xpaste = "xclip -o";
      S = "exec $SHELL";
      zathura = "evince";
      programming = "cd ~/Documents/Programming";
      nixconfig = "cd ~/.config/nix";
      tf = "terraform";
      k = "kubectl";
      ignore = "${pkgs.git-ignore}/bin/git-ignore $(${pkgs.git-ignore}/bin/git-ignore -l 2> /dev/null | ${pkgs.fzf}/bin/fzf -m)";
    };

    plugins = [
      {
        name = "nix-zsh-completions";
        file = "nix-zsh-completions.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "spwhitt";
          repo = "nix-zsh-completions";
          rev = "0.4.4";
          sha256 = "Djs1oOnzeVAUMrZObNLZ8/5zD7DjW3YK42SWpD2FPNk=";
        };
      }
    ];
  };
}
