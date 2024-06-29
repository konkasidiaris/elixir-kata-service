{ pkgs ? (import <nixpkgs> {}), ... }:
with pkgs;

let
  otp = beam.packages.erlangR25;
  basePackages = [otp.elixir_1_16];

  # Hot reloading stuff
  inputs = basePackages ++ lib.optionals stdenv.isLinux [ inotify-tools] ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [CoreFoundation CoreServices]);
in pkgs.mkShell {
  buildInputs = inputs;

  # keep shell history in iex
  ERL_AFLAGS = "-kernel shell_history enabled";

  shellHook = ''
    #this isolates mix to work only in local directory
    mkdir -p .nix-mix .nix-hel
    export MIX_HOME=$PWD/.nix-mix
    export HEX_HOME=$PWD/.nix-hex

    # make hex from Nixpkgs available
    # `mix local.hex` will install hex into MIX_HOME and should take precedence
    export MIX_PATH="${otp.hex}/lib/erlang/lib/hex/ebin"
    export PATH=$MIX_HOME/bin:$HEX_HOME/bin:$PATH
  '';
}
