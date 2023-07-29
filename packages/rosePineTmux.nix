{ fetchFromGitHub
, mkTmuxPlugin
, lib
}:
mkTmuxPlugin {
  pluginName = "rose-pine";
  name = "rose-pine";
  src = fetchFromGitHub {
    owner = "rose-pine";
    repo = "tmux";
    rev = "054c48921109a6862c728827dfed3c5b88eb1cfe";
    sha256 = "5ydsUAtmlPeTtuildcjsubrWUQznE2KZ5hyxqOtu+Og=";
  };
}
