{
  description = "Shadowblaze";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    nix-colors.url = "github:misterio77/nix-colors";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    nixvim.url = "github:hemanth-92/nixvim";
    nur.url = "github:nix-community/nur";
    catppuccin.url = "github:catppuccin/nix";
    # DELETEME: Zen
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    #zen-browser.url = "github:hemanth-92/zen-browser-flake";
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";

    hyprmag.url = "github:SIMULATAN/hyprmag";

    hypr-contrib.url = "github:hyprwm/contrib";
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "zenith";
      hostname = "shadowblaze";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            inherit hostname;
          };
          modules = [
            ./nixos
            home-manager.nixosModules.home-manager
            inputs.distro-grub-themes.nixosModules.${system}.default
            inputs.nur.modules.nixos.default
            {
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit inputs;
                inherit hostname;
              };
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.${username} = import ./home/default.nix;
              };
            }
          ];
        };
      };
    };
}
