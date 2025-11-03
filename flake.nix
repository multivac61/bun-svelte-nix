{
  description = "Bun2Nix minimal sample";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    bun2nix.url = "github:fleek-platform/bun2nix?ref=f504a89aadfa5b3c0baf30d97e0c6e3faecaa73d";
    bun2nix.inputs.nixpkgs.follows = "nixpkgs";
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
      bun2nix,
      ...
    }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      eachSystem = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = eachSystem (system: import nixpkgs { inherit system; });
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
    in
    {
      inherit packages;

      checks = packages;

      devShells = eachSystem (system: {
        default = pkgsFor.${system}.mkShell {
          packages = with pkgsFor.${system}; [
            bun
            bun2nix.packages.${system}.default
          ];

          shellHook = ''
            bun install
          '';
        };
      });
    };
}
