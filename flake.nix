{
  description = "Unison language playground";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    unison-lang = {
      url = github:ceedubs/unison-nix;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, unison-lang, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ unison-lang.overlay ];
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "unison-dev-shell";
        buildInputs = with pkgs; [
          unison-ucm
        ];
      };

      packages.${system} = {
        default = pkgs.unison-ucm;
        ucm = pkgs.unison-ucm;
      };
    };
}
