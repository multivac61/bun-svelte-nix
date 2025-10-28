{ mkBunDerivation, ... }:
mkBunDerivation {
  pname = "sveltekit-bun2nix-example";
  version = "0.0.1";

  src = ./.;

  bunNix = ./bun.nix;

  buildPhase = ''
    runHook preBuild

    bun run build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -R ./build $out

    runHook postInstall
  '';
}
