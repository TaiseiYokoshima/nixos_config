# dotfiles, 
{ config, pkgs,
... 
}:
let 

  flameshotGrim = pkgs.flameshot.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "flameshot-org";
      repo = "flameshot";
      rev = "3d21e4967b68e9ce80fb2238857aa1bf12c7b905";
      sha256 = "sha256-OLRtF/yjHDN+sIbgilBZ6sBZ3FO6K533kFC1L2peugc=";
    };
    cmakeFlags = [
      "-DUSE_WAYLAND_CLIPBOARD=1"
      "-DUSE_WAYLAND_GRIM=1"
      # "USE_WAYLAND_CLIPBOARD=1"
    ];
    buildInputs = oldAttrs.buildInputs ++ [ pkgs.libsForQt5.kguiaddons ];
  });

  dotfiles = pkgs.fetchFromGitHub {
    owner = "TaiseiYokoshima";
    repo = ".dotfiles";
    rev = "f2718c4ac630f05e52413467d906a4a3046eb75a";
    sha256 = "h27LhIMaPUXIxr9TEcQNUQJyy3NYPJA3REyhURmGNT0=";
    fetchSubmodules = true;
  };



in
{
  home.username = "rom";
  home.homeDirectory = "/home/rom";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  home.file = {
      ".config/alacritty".source = "${dotfiles}/alacritty";
      ".config/kitty".source = "${dotfiles}/kitty";
      ".config/wezterm".source = "${dotfiles}/wezterm";

      ".config/nvim".source = "${dotfiles}/nvim";
      ".config/fish".source = "${dotfiles}/fish";
      ".config/zellij".source = "${dotfiles}/zellij";
      ".config/tmux".source = "${dotfiles}/tmux";

      ".config/hypr".source = "${dotfiles}/hypr";
      ".config/sway".source = "${dotfiles}/sway";

      ".config/waybar".source = "${dotfiles}/waybar";
      ".config/rofi".source = "${dotfiles}/rofi";
      ".config/wallpapers".source = "${dotfiles}/wallpapers";
      ".config/scripts".source = "${dotfiles}/scripts";
      ".config/dunst".source = "${dotfiles}/dunst";
  };


  home.packages = with pkgs; [
    flameshotGrim
  ];



  services.flameshot = {
    enable = true;
    package = flameshotGrim;
  };



  # xsession.enable = true;
  # home.sessionVariables = {
  #   GTK_IM_MODULE = "fcitx";
  #   QT_IM_MODULE = "fcitx";
  #   XMODIFIERS = "@im=fcitx";
  #   INPUT_METHOD = "fcitx";
  # };




}
