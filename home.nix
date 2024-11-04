{ pkgs, globalVars, ... }:
{
  imports = [ ./vim ];

  # add cool packages you want to install
  # see https://search.nixos.org/packages for package names
  home.packages = with pkgs; [
    sl
    # ...
  ];

  # remap capslock key to escape
  home.keyboard.options = [ "caps:escape" ];

  home.username = globalVars.defaultUser;
  home.homeDirectory = "/home/${globalVars.defaultUser}";

  home.stateVersion = "23.11";
}
