{
  description = "Unison language playground";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://unison.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "unison.cachix.org-1:i1DUFkisRPVOyLp/vblDsbsObmyCviq/zs6eRuzth3k="
    ];
  };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    unison-nix.url = "github:ceedubs/unison-nix";
  };

  outputs = { nixpkgs, unison-nix, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShellNoCC {
        name = "unison-dev-shell";

        buildInputs = with unison-nix.packages.${system}; [
          ucm-bin
          ucm-desktop
        ];
      };
    };
}
