{
  description = "Unison language playground";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://cache.garnix.io"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    unison-nix.url = github:ceedubs/unison-nix;
  };

  outputs = { nixpkgs, unison-nix, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ unison-nix.overlay ];
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "unison-dev-shell";
        buildInputs = with pkgs; [
          unison-ucm
        ];
      };
    };
}
