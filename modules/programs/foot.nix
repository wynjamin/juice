{ lib,  ... }:

{
    programs.foot = {
        enable = true;
        enableFishIntegration = true;
    };

    hj = {
        xdg.config.files."foot/foot.ini" = {
            generator = lib.generators.toINIWithGlobalSection {};
            value = {
                globalSection = {
                    font = "FiraCode Nerd Font Mono:size=11";
                };

                sections = {
                    main = {
                        dpi-aware = "yes";
                        strikeout-thickness = "2px";
                        # pad = "7x5";
                    };

                    mouse = {
                        hide-when-typing = "yes";
                    };
                };
            };
        };
    };
}
