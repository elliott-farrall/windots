{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          python3
          python3Packages.pip
        ];

        shellHook = ''
          if [ ! -d .venv ]; then
            python3 -m venv .venv
          fi
          source .venv/bin/activate

          pip install ansible ansible-lint --quiet

          ansible-galaxy collection install ansible.windows
        '';
      };
    };
}
