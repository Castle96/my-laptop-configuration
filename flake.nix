{
  description = "NixOS configuration for Dell Latitude 7300 with Home Manager and Hyprland";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager";
    dotfiles.url = "github:ryan4yin/nix-config"; # Replace with the actual repository URL
  };

  outputs = { self, nixpkgs, home-manager, dotfiles }:
    let
      systemPkgsOverlay = final: prev: {
        myLaptopPkgs = prev.pkgs.buildPackages;
      };
    in {
      nixosConfigurations.dell-latitude-7300 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/dell-latitude-7300/configuration.nix
          { nixpkgs.overlays = [ systemPkgsOverlay ]; }
        ];
      };

      homeConfigurations.kyle = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        homeDirectory = "/home/kyle"; # Replace with actual username
        username = "kyle";
        modules = [
          ./home/home.nix
        ];
      };
    };
}
