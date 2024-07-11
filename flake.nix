{
  description = "Shadowblaze";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
    # hyprland = {
    #   type = "git";
    #   url = "https://github.com/hyprwm/Hyprland";
    #   submodules = true;
    # };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:hemanth-92/nixvim";
    
    catppuccin-grub = {
      url = "github:catppuccin/grub";
      flake = false;
    };

    impermanence.url = "github:nix-community/impermanence";
    nur.url = "github:nix-community/nur";
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      impermanence,
      ...
    }:
    let
      system = "x86_64-linux";
      inherit (import ./options.nix) username hostname;

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
            ./system.nix
            impermanence.nixosModules.impermanence
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit inputs;
                inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
              };
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.${username} = import ./home.nix;
              };
            }
          ];
        };
      };
    };
}
