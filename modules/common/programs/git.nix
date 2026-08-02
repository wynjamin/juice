{ pkgs, lib, ... }:
let
  hosts = [
    "https://github.com"
    "https://gist.github.com"
  ];
in
{
  hj.packages = with pkgs; [
    github-cli
  ];

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "master";

      user = {
        name = "7elia";
        email = "176603882+7elia@users.noreply.github.com";
      };

      core = {
        compression = 9;
        whitespace = "error";
        preloadindex = true;
      };

      advice = {
        addEmptyPathspec = false;
        pushNonFastForward = false;
        statusHints = false;
      };

      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };

      diff = {
        context = 3;
        renames = "copies";
        interHunkContext = 10;
      };

      url = {
        "https://github.com/" = {
          insteadOf = [
            "gh:"
            "github:"
          ];
        };
      };

      credential = builtins.listToAttrs (
        map (
          host:
          lib.nameValuePair host {
            helper = [
              ""
              "${pkgs.github-cli}/bin/gh auth git-credential"
            ];
          }
        ) hosts
      );
    };
  };
}
