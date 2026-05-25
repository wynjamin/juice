{ pkgs, ... }:

{
    hj.packages = with pkgs; [
        git
        git-credential-manager
        github-cli
    ];

    programs.git = {
        enable = true;
        config = {
            init.defaultBranch = "master";

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
	                insteadOf = [ "gh:" "github:" ];
                };
            };
        };
    };
}
