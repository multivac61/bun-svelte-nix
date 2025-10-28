{
  description = "Bun2Nix minimal sample";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";

    bun2nix.url = "github:fleek-platform/bun2nix?ref=84a6c59cd96d985be55fad2596dc82f006f601ca";
    bun2nix.inputs.nixpkgs.follows = "nixpkgs";
    bun2nix.inputs.systems.follows = "systems";
  };

  # Use the cached version of bun2nix from the garnix cli
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

  outputs =
    {
      nixpkgs,
      systems,
      bun2nix,
      ...
    }:
    let
      # Read each system from the nix-systems input
      eachSystem = nixpkgs.lib.genAttrs (import systems);

      # Access the package set for a given system
      pkgsFor = eachSystem (system: import nixpkgs { inherit system; });
    in
    {
      packages = eachSystem (
        system:
        let
          bun2nixPkg = bun2nix.packages.${system}.default;
        in
        {
          default = pkgsFor.${system}.stdenv.mkDerivation {
            pname = "my-app";
            version = "0.0.1";

            src = ./.;

            nativeBuildInputs = [ bun2nixPkg.hook ];

            bunDeps = bun2nixPkg.fetchBunDeps { bunNix = ./bun.nix; };

            buildPhase = ''
              runHook preBuild

              bun run build --minify

              runHook postBuild
            '';

            installPhase = ''
              runHook preInstall

              mkdir -p $out
              cp -R ./build/. $out

              runHook postInstall
            '';
          };
        }
      );

      devShells = eachSystem (system: {
        default = pkgsFor.${system}.mkShell {
          packages = with pkgsFor.${system}; [
            bun
            bun2nix.packages.${system}.default
          ];

          shellHook = ''
            bun install --frozen-lockfile
          '';
        };
      });
    };
}
