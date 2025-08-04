{ pkgs
, stdenv
, ...
}:
let
  codexRepo = pkgs.fetchFromGitHub {
    owner = "openai";
    repo = "codex";
    rev = "dc15a5cf0b50eaa7a75dca754d618090d41d51e3";
    sha256 = "sha256-gmFbj5iuv5U2PuXe/F0P22VKuQfgXsAxVAISvnx29m0=";
  };

  codex-cli = stdenv.mkDerivation (finalAttrs: {
    pname = "codex-cli";
    version = "0.1.0";
    src = codexRepo;
    nativeBuildInputs = with pkgs; [
      nodejs
      pnpm
      cacert
    ];

    buildPhase = ''
      export NODE_EXTRA_CA_CERTS=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt
      rm -f pnpm-lock.yaml
      pnpm install
      pnpm run build
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin
      mkdir -p $out/lib

      cp -r codex-cli/dist/* $out/lib/
      cp codex-cli/package.json $out/
      ln -s $out/lib/cli.js $out/bin/codex
      chmod +x $out/bin/codex

      runHook postInstall
    '';
  });
in
codex-cli
