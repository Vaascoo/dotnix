# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "apps/seahorse/listing" = {
      keyrings-selected = [ "gnupg://" ];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 476;
      width = 600;
    };

    "ca/desrt/dconf-editor" = {
      saved-pathbar-path = "/org/gnome/system/";
      saved-view = "/org/gnome/";
      show-warning = false;
      window-height = 1120;
      window-is-maximized = false;
      window-width = 960;
    };

    "one/alynx/showmethekey" = {
      first-time = false;
    };

    "org/blueman/general" = {
      window-properties = [ 830 884 0 0 ];
    };

    "org/blueman/plugins/powermanager" = {
      auto-power-on = "@mb true";
    };

    "org/gnome/Console" = {
      font-scale = 1.8000000000000007;
      last-window-size = mkTuple [ 960 1173 ];
      theme = "night";
    };

    "org/gnome/Geary" = {
      migrated-config = true;
      window-height = 1152;
      window-width = 948;
    };

    "org/gnome/calendar" = {
      active-view = "month";
      window-maximized = true;
      window-size = mkTuple [ 768 600 ];
    };

    "org/gnome/cheese" = {
      burst-delay = 1000;
      camera = "Integrated RGB Camera  Integrat";
      photo-x-resolution = 1920;
      photo-y-resolution = 1080;
      video-x-resolution = 1920;
      video-y-resolution = 1080;
    };

    "org/gnome/clocks/state/window" = {
      maximized = false;
      panel-id = "world";
      size = mkTuple [ 870 690 ];
    };

    "org/gnome/control-center" = {
      last-panel = "usage";
      window-state = mkTuple [ 1920 1168 ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" ];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/vasco/.local/share/backgrounds/2023-03-06-01-40-06-crosswalk.jpg";
      picture-uri-dark = "file:///home/vasco/.local/share/backgrounds/2023-03-06-01-40-06-crosswalk.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "pt" ]) (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-theme = "Adwaita-dark";
      icon-theme = "Adwaita";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-settings" "firefox" "gnome-power-panel" "discord" "spotify" "thunderbird" "gnome-network-panel" "code" "slack" "org-gnome-screenshot" "zoom" "org-gnome-nautilus" "idea-ultimate" "code-url-handler" "kitty" "org-gnome-evince" "chromium-browser" "transmission-gtk" "brave-browser" "org-gnome-console" "ca-desrt-dconf-editor" "pavucontrol" "obsidian" "webcord" "org-gnome-epiphany" ];
    };

    "org/gnome/desktop/notifications/application/brave-browser" = {
      application-id = "brave-browser.desktop";
    };

    "org/gnome/desktop/notifications/application/ca-desrt-dconf-editor" = {
      application-id = "ca.desrt.dconf-editor.desktop";
    };

    "org/gnome/desktop/notifications/application/chromium-browser" = {
      application-id = "chromium-browser.desktop";
    };

    "org/gnome/desktop/notifications/application/code-url-handler" = {
      application-id = "code-url-handler.desktop";
    };

    "org/gnome/desktop/notifications/application/code" = {
      application-id = "code.desktop";
    };

    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/idea-ultimate" = {
      application-id = "idea-ultimate.desktop";
    };

    "org/gnome/desktop/notifications/application/kitty" = {
      application-id = "kitty.desktop";
    };

    "org/gnome/desktop/notifications/application/obsidian" = {
      application-id = "obsidian.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-epiphany" = {
      application-id = "org.gnome.Epiphany.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-evince" = {
      application-id = "org.gnome.Evince.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-screenshot" = {
      application-id = "org.gnome.Screenshot.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/pavucontrol" = {
      application-id = "pavucontrol.desktop";
    };

    "org/gnome/desktop/notifications/application/slack" = {
      application-id = "slack.desktop";
    };

    "org/gnome/desktop/notifications/application/spotify" = {
      application-id = "spotify.desktop";
    };

    "org/gnome/desktop/notifications/application/thunderbird" = {
      application-id = "thunderbird.desktop";
    };

    "org/gnome/desktop/notifications/application/transmission-gtk" = {
      application-id = "transmission-gtk.desktop";
    };

    "org/gnome/desktop/notifications/application/webcord" = {
      application-id = "webcord.desktop";
    };

    "org/gnome/desktop/notifications/application/zoom" = {
      application-id = "Zoom.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      speed = -0.24200913242009137;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/vasco/.local/share/backgrounds/2023-03-06-01-40-06-crosswalk.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
      event-sounds = false;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Shift><Super>q" ];
      maximize = [ ];
      minimize = [ ];
      move-to-workspace-1 = [ "<Super><Shift>1" ];
      move-to-workspace-10 = [ "<Super><Shift>0" ];
      move-to-workspace-2 = [ "<Super><Shift>2" ];
      move-to-workspace-3 = [ "<Super><Shift>3" ];
      move-to-workspace-4 = [ "<Super><Shift>4" ];
      move-to-workspace-5 = [ "<Super><Shift>5" ];
      move-to-workspace-6 = [ "<Super><Shift>6" ];
      move-to-workspace-7 = [ "<Super><Shift>7" ];
      move-to-workspace-8 = [ "<Super><Shift>8" ];
      move-to-workspace-9 = [ "<Super><Shift>9" ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-10 = [ "<Super>0" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ "<Super>5" ];
      switch-to-workspace-6 = [ "<Super>6" ];
      switch-to-workspace-7 = [ "<Super>7" ];
      switch-to-workspace-8 = [ "<Super>8" ];
      switch-to-workspace-9 = [ "<Super>9" ];
      switch-to-workspace-left = [ "<Shift><Super>h" ];
      switch-to-workspace-right = [ "<Shift><Super>l" ];
      toggle-fullscreen = [ "<Super>f" ];
      unmaximize = [ ];
    };

    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 10;
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/epiphany/state" = {
      is-maximized = false;
      window-size = mkTuple [ 1920 876 ];
    };

    "org/gnome/evince" = {
      document-directory = "@ms 'file:///home/vasco/Downloads'";
    };

    "org/gnome/evince/default" = {
      continuous = false;
      dual-page = false;
      dual-page-odd-left = false;
      enable-spellchecking = true;
      fullscreen = false;
      inverted-colors = false;
      show-sidebar = false;
      sidebar-page = "thumbnails";
      sidebar-size = 132;
      sizing-mode = "free";
      window-ratio = mkTuple [ 1.610738255033557 1.3586698337292162 ];
      zoom = 0.5417415026626013;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 250;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 525;
      window-width = 948;
    };

    "org/gnome/gnome-screenshot" = {
      delay = 1;
      include-pointer = false;
      last-save-directory = "file:///home/vasco/Pictures";
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = false;
      edge-tiling = false;
      focus-change-on-pointer-rest = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ ];
      toggle-tiled-right = [ ];
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "extra-large";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
      search-view = "list-view";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 960 1168 ];
      maximized = false;
    };

    "org/gnome/nm-applet/eap/31c195b0-27f9-48fb-aefc-af798a52e162" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/7003324d-b57c-4cda-a85b-9b393a96c629" = {
      ignore-ca-cert = true;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/b76f6823-e6e6-4946-9228-f5a743a0e5af" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/cb9f9246-632c-4a2f-b848-c1a464fc51e1" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/portal/filechooser/com/discordapp/Discord" = {
      last-folder-path = "/home/vasco/Pictures/Webcam";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-to = 8.0;
      night-light-temperature = mkUint32 2543;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" ];
      help = [ ];
      logout = [ "<Shift><Super>e" ];
      next = [ "XF86HangupPhone" ];
      next-static = [ "XF86AudioNext" "<Ctrl>XF86AudioNext" "XF86HangupPhone" ];
      play = [ "XF86NotificationCenter" ];
      previous = [ "XF86PickupPhone" ];
      previous-static = [ "XF86AudioPrev" "<Ctrl>XF86AudioPrev" "XF86PickupPhone" ];
      screensaver = [ "<Super>q" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "footclient \"tmux\"";
      name = "foot";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Shift><Super>s";
      command = "gnome-screenshot -i";
      name = "screenshot";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
    };

    "org/gnome/shell" = {
      app-picker-layout = "[{'org.gnome.Contacts.desktop': <{'position': <0>}>, 'org.gnome.Weather.desktop': <{'position': <1>}>, 'org.gnome.clocks.desktop': <{'position': <2>}>, 'org.gnome.Maps.desktop': <{'position': <3>}>, 'org.gnome.Totem.desktop': <{'position': <4>}>, 'org.gnome.Calculator.desktop': <{'position': <5>}>, 'simple-scan.desktop': <{'position': <6>}>, 'org.gnome.Settings.desktop': <{'position': <7>}>, 'Alacritty.desktop': <{'position': <8>}>, 'gnome-system-monitor.desktop': <{'position': <9>}>, 'amazonPrimeVideo.desktop': <{'position': <10>}>, 'blueman-manager.desktop': <{'position': <11>}>, 'org.gnome.Photos.desktop': <{'position': <12>}>, 'org.gnome.Music.desktop': <{'position': <13>}>, 'Utilities': <{'position': <14>}>, 'ca.desrt.dconf-editor.desktop': <{'position': <15>}>, 'org.gnome.Calendar.desktop': <{'position': <16>}>, 'yelp.desktop': <{'position': <17>}>, 'org.gnome.Cheese.desktop': <{'position': <18>}>, 'firefox.desktop': <{'position': <19>}>, 'org.gnome.Extensions.desktop': <{'position': <20>}>, 'org.gnome.Geary.desktop': <{'position': <21>}>, 'htop.desktop': <{'position': <22>}>, 'hbo.desktop': <{'position': <23>}>}, {'com.github.iwalton3.jellyfin-media-player.desktop': <{'position': <0>}>, 'org.pipewire.Helvum.desktop': <{'position': <1>}>, 'kitty.desktop': <{'position': <2>}>, 'netflix.desktop': <{'position': <3>}>, 'nixos-manual.desktop': <{'position': <4>}>, 'pavucontrol.desktop': <{'position': <5>}>, 'org.gnome.Software.desktop': <{'position': <6>}>, 'com.stremio.Stremio.desktop': <{'position': <7>}>, 'org.gnome.TextEditor.desktop': <{'position': <8>}>, 'org.gnome.Tour.desktop': <{'position': <9>}>, 'one.alynx.showmethekey.desktop': <{'position': <10>}>, 'transmission-gtk.desktop': <{'position': <11>}>, 'io.github.TransmissionRemoteGtk.desktop': <{'position': <12>}>, 'virt-manager.desktop': <{'position': <13>}>, 'vlc.desktop': <{'position': <14>}>, 'nvim.desktop': <{'position': <15>}>, 'xterm.desktop': <{'position': <16>}>, 'Zoom.desktop': <{'position': <17>}>, 'wine-Programs-AltServer.desktop': <{'position': <18>}>, 'org.gnome.Epiphany.desktop': <{'position': <19>}>, 'calibre-gui.desktop': <{'position': <20>}>, 'calibre-ebook-edit.desktop': <{'position': <21>}>, 'calibre-ebook-viewer.desktop': <{'position': <22>}>, 'org.codeberg.dnkl.footclient.desktop': <{'position': <23>}>}, {'pt.gov.autenticacao.desktop': <{'position': <0>}>, 'org.codeberg.dnkl.foot-server.desktop': <{'position': <1>}>, 'calibre-lrfviewer.desktop': <{'position': <2>}>, 'sonixd.desktop': <{'position': <3>}>, 'net.lutris.Lutris.desktop': <{'position': <4>}>, 'winetricks.desktop': <{'position': <5>}>, 'idea-ultimate.desktop': <{'position': <6>}>, 'emacs.desktop': <{'position': <7>}>, 'emacsclient.desktop': <{'position': <8>}>}]";
      disable-user-extensions = false;
      disabled-extensions = [ "tiling-assistant@leleat-on-github" "windowsNavigator@gnome-shell-extensions.gcampax.github.com" "blur-my-shell@aunetx" "Vitals@CoreCoding.com" "trayIconsReloaded@selfmade.pl" ];
      enabled-extensions = [ "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "pop-shell@system76.com" "user-theme@gnome-shell-extensions.gcampax.github.com" "appindicatorsupport@rgcjonas.gmail.com" "dash-to-dock@micxgx.gmail.com" ];
      favorite-apps = [ "brave-browser.desktop" "spotify.desktop" "org.codeberg.dnkl.foot.desktop" "discord.desktop" "obsidian.desktop" "qalculate-gtk.desktop" "slack.desktop" "thunderbird.desktop" "org.gnome.Nautilus.desktop" ];
      last-selected-power-profile = "performance";
      remember-mount-password = false;
      welcome-dialog-last-shown-version = "43.2";
    };

    "org/gnome/shell/extensions/appindicator" = {
      tray-pos = "right";
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      brightness = 0.66;
      sigma = 41;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = false;
      background-opacity = 0.8;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 1.0;
      hot-keys = false;
      multi-monitor = true;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
    };

    "org/gnome/shell/extensions/pop-shell" = {
      activate-launcher = [ "<Super>d" ];
      active-hint = false;
      active-hint-border-radius = mkUint32 2;
      focus-left = [ "<Super>h" "<Super>Left" ];
      gap-inner = mkUint32 0;
      gap-outer = mkUint32 0;
      hint-color-rgba = "rgba(233, 84, 32, 0.8)";
      mouse-cursor-focus-location = mkUint32 1;
      smart-gaps = true;
      tile-by-default = true;
      tile-enter = [ "<Super>r" ];
      toggle-floating = [ "<Super>Space" ];
    };

    "org/gnome/shell/extensions/tiling-assistant" = {
      activate-layout0 = [ ];
      activate-layout1 = [ ];
      activate-layout2 = [ ];
      activate-layout3 = [ ];
      active-window-hint = 1;
      active-window-hint-color = "rgb(53,132,228)";
      auto-tile = [ ];
      center-window = [ ];
      debugging-free-rects = [ ];
      debugging-show-tiled-rects = [ ];
      default-move-mode = 0;
      dynamic-keybinding-behaviour = 0;
      import-layout-examples = false;
      last-version-installed = 41;
      restore-window = [ "<Super>Down" ];
      search-popup-layout = [ ];
      tile-bottom-half = [ "<Super>KP_2" ];
      tile-bottom-half-ignore-ta = [ ];
      tile-bottomleft-quarter = [ "<Super>KP_1" ];
      tile-bottomleft-quarter-ignore-ta = [ ];
      tile-bottomright-quarter = [ "<Super>KP_3" ];
      tile-bottomright-quarter-ignore-ta = [ ];
      tile-edit-mode = [ ];
      tile-left-half = [ "<Super>Left" "<Super>KP_4" ];
      tile-left-half-ignore-ta = [ ];
      tile-maximize = [ "<Super>Up" "<Super>KP_5" ];
      tile-maximize-horizontally = [ ];
      tile-maximize-vertically = [ ];
      tile-right-half = [ "<Super>Right" "<Super>KP_6" ];
      tile-right-half-ignore-ta = [ ];
      tile-top-half = [ "<Super>KP_8" ];
      tile-top-half-ignore-ta = [ ];
      tile-topleft-quarter = [ "<Super>KP_7" ];
      tile-topleft-quarter-ignore-ta = [ ];
      tile-topright-quarter = [ "<Super>KP_9" ];
      tile-topright-quarter-ignore-ta = [ ];
      toggle-always-on-top = [ ];
      toggle-tiling-popup = [ ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "";
    };

    "org/gnome/shell/extensions/vitals" = {
      hot-sensors = [ "_memory_usage_" "__network-rx_max__" "__temperature_max__" ];
      position-in-panel = 2;
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ ];
      switch-to-application-1 = [ ];
      switch-to-application-2 = [ ];
      switch-to-application-3 = [ ];
      switch-to-application-4 = [ ];
      switch-to-application-5 = [ ];
      switch-to-application-6 = [ ];
      switch-to-application-7 = [ ];
      switch-to-application-8 = [ ];
      switch-to-application-9 = [ ];
    };

    "org/gnome/shell/overrides" = {
      edge-tiling = false;
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1698734642;
      first-run = false;
      flatpak-purge-timestamp = mkInt64 1698857765;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 159;
      sort-column = "modified";
      sort-directories-first = false;
      sort-order = "descending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 960 1048 ];
    };

    "org/gtk/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.5647058823529412 0.9333333333333333 ]) (mkTuple [ 0.0 0.0 ]) (mkTuple [ 1.0 0.27058823529411763 ]) ];
      selected-color = mkTuple [ true 1.0 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 165;
      sort-column = "modified";
      sort-directories-first = false;
      sort-order = "descending";
      type-format = "category";
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 960 1121 ];
    };

    "org/virt-manager/virt-manager" = {
      manager-window-height = 1132;
      manager-window-width = 960;
      xmleditor-enabled = true;
    };

    "org/virt-manager/virt-manager/confirm" = {
      delete-storage = true;
      forcepoweroff = true;
      removedev = true;
      unapplied-dev = true;
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };

    "org/virt-manager/virt-manager/details" = {
      show-toolbar = true;
    };

    "org/virt-manager/virt-manager/new-vm" = {
      graphics-type = "system";
    };

    "org/virt-manager/virt-manager/paths" = {
      image-default = "/home/vasco/Documents/Programming/github.com/OSX-KVM";
      media-default = "/home/vasco/Downloads";
    };

    "org/virt-manager/virt-manager/vmlist-fields" = {
      disk-usage = false;
      network-traffic = false;
    };

    "system/proxy" = {
      mode = "none";
    };

  };
}
