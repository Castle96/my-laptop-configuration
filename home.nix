{ config, pkgs, dotfiles, ... }:

{
  programs.home-manager.enable = true;

  # Symlink dotfiles directly from the flake input
  home.file = {
    ".config/hypr/hyprland.conf".source = "${dotfiles}/.config/hypr/hyprland.conf";
    ".config/waybar/config".source = "${dotfiles}/.config/waybar/config";
    ".config/waybar/style.css".source = "${dotfiles}/.config/waybar/style.css";
    ".config/alacritty/alacritty.yml".source = "${dotfiles}/.config/alacritty/alacritty.yml";
    ".config/zsh/.zshrc".source = "${dotfiles}/.config/zsh/.zshrc";
  };

  # Install CLI and GUI packages
  home.packages = with pkgs; [
    hyprland
    waybar
    alacritty
    zsh
  ];

  # Enable Hyprland
  services.hyprland.enable = true;
}
