{ config, pkgs, ... }:

{
  imports = [
    ./theming/default.nix
  ];

  home.packages = with pkgs; [
    alacritty
    brightnessctl
    fzf
  ];

  services.polkit-gnome.enable = true;
  services.mpris-proxy.enable = true;

  programs.ssh = {
    enable = true;
  };

  programs.git = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ## Theming

      github.github-vscode-theme
      vscode-icons-team.vscode-icons

      ## Languages/Syntax Highlighting/Intellisense

      jnoortheen.nix-ide

      redhat.vscode-yaml
      redhat.vscode-xml
      
      redhat.java
      vue.volar
      rust-lang.rust-analyzer
      ms-python.python
      dart-code.flutter
      prisma.prisma
      tamasfe.even-better-toml
      dart-code.dart-code

      esbenp.prettier-vscode

      # Missing: PHP, Laravel, Livewire, KDL
      
      # Miscellaneous

      anthropic.claude-code
    ];
  };
}