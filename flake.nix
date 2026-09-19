{
  description = "Neovim Stable Overlay with nvfetcher";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    overlays.default =
      final: prev:
      let
        sources = final.callPackage ./_sources.nix { };
      in
      {
        neovim-stable = prev.neovim-unwrapped.overrideAttrs (old: {
          version = sources.neovim-stable.version;
          src = sources.neovim-stable.src;
        });
      };
  };
}
