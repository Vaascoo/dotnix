{ fetchFromGitHub
, mkTmuxPlugin
, lib
}:
mkTmuxPlugin {
  pluginName = "tokyo-night-tmux";
  name = "tokyo-night-tmux";
  src = fetchFromGitHub {
    owner = "janoamaral";
    repo = "tokyo-night-tmux";
    rev = "9bba871bd7af93026715b5b232fa3e9e3d9e7a01";
    sha256 = "R1t6E5Dd3Zq0MPdXnYyvU0+juC2/0pt6r+Hi3QeMKm4=";
  };
}
