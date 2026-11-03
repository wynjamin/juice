{nvf, ...}: {
  imports = [nvf];

  programs.nvf.settings.clipboard.providers.wl-copy.enable = true;
}
