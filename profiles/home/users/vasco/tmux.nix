{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.tilish;
        extraConfig = ''
          set -g @tilish-dmenu 'on'
          set -g @tilish-navigator 'on'
          set -g @tilish-shiftnum '!"#$%&/()='
          bind -n "M-f" resize-pane -Z
        '';
      }
    ];
    extraConfig = ''
      set-option -g status-style bg=default
      set-option -g status-position top
      set-option -ga terminal-overrides ",xterm-256color:Tc"
      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi V send -X select-line
      bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'wl-copy'
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      set -g base-index 1
      setw -g pane-base-index 1
      set -g mouse on
      set -sg escape-time 10
    '';
  };
}
