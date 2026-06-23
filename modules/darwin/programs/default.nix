{ pkgs, ... }:

{
  hj.packages = with pkgs; [ ghostty-bin ];
}
