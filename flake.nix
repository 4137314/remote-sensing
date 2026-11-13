{
  description = "Remote sensing systems and image analysis: study knowledge base";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Emacs reader for the knowledge base (study/): separate repository, shared with
    # other projects.
    knowledge-base = {
      url = "git+ssh://git@github.com/4137314/knowledge-base";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, knowledge-base }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # Reader for study/kb: command remote-sensing-study, server "remote-sensing",
      # state in ~/.local/state/remote-sensing-emacs; domains, areas and forbidden
      # words in study/kb-config.el.
      study = knowledge-base.lib.mkReader pkgs {
        name = "remote-sensing";
        notes = "study/kb";
        config = "study/kb-config.el";
        rootVar = "RS_ROOT";
      };
    in {
      packages.${system} = {
        inherit study;
        default = study;
      };

      apps.${system}.default = {
        type = "app";
        program = "${study}/bin/remote-sensing-study";
      };

      # Python for the laboratory exercises (image processing, classification).
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.gnumake
          (pkgs.python3.withPackages (ps: with ps; [
            numpy scipy matplotlib scikit-learn scikit-image rasterio jupyter
          ]))
        ];
        shellHook = ''
          echo "remote-sensing: make help (knowledge base: make study)"
        '';
      };
    };
}
