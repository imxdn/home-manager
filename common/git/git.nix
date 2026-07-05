{ ... }:
{
  programs.git = {
    enable = true;

    ignores = [ "**/.claude/settings.local.json" ];

    settings = {
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";

      # Sane defaults
      push.autoSetupRemote = true; # first push creates upstream automatically
      pull.rebase = true; # rebase instead of merge on pull
      rebase.autoStash = true; # stash/pop around rebase (helps main<-work)
      fetch.prune = true; # drop deleted remote branches on fetch
      init.defaultBranch = "main";
    };
  };
}
