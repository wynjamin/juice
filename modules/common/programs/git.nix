{ pkgs, lib, ... }:
let
  hosts = [
    "https://github.com"
    "https://gist.github.com"
  ];
in
{
  hj = {
    packages = with pkgs; [
      git
      git-credential-manager
      github-cli
    ];

    files.".gitconfig".text = lib.generators.toGitINI {
      init.defaultBranch = "master";

      user = {
        name = "wyn";
        email = "176603882+wynjamin@users.noreply.github.com";
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
