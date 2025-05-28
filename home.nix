# dotfiles, 
{ config, pkgs,
... 
}:
let 

  flameshotGrim = pkgs.flameshot.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "flameshot-org";
      repo = "flameshot";
      rev = "2e45e85d331ece2729d613ec705786ab1cf7a5b5";
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
    rev = "845bd63007b3121e84df41a1cf53d43b0cd14652";
    sha256 = "qOBXcL+JKdIPR+lxaAKqvY8rnl/xKOpKqRPWhRiLZDw=";
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
      ".config/fcitx5".source = "${dotfiles}/fcitx5";
  };


  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };


  home.packages = with pkgs; [
    flameshotGrim

    # fcitx5
    # fcitx5-mozc
    # fcitx5-gtk
    # fcitx5-configtool
  ];



  services.flameshot = {
    enable = true;
    package = flameshotGrim;
  };



}
