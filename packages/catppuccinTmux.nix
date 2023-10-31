{
  fetchFromGitHub,
  mkTmuxPlugin,
}:
mkTmuxPlugin {
  pluginName = "catppuccin";
  name = "catppuccin";
  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "tmux";
    rev = "e2561decc2a4e77a0f8b7c05caf8d4f2af9714b3";
    sha256 = "6UmFGkUDoIe8k+FrzdzsKrDHHMNfkjAk0yyc+HV199M=";
  };
}
