{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kusa";
  home.homeDirectory = "/home/kusa";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;


  # Cursor Theme
  # home.pointerCursor = {
  #   name = "phinger-cursors-light";
  #   package = pkgs.phinger-cursors;
  #   size = 32;
  #   gtk.enable = true;
  # };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [

        
    # (pkgs.neovim.overrideAttrs (old: {
    #   src = pkgs.fetchFromGitHub {
    #     owner = "neovim";
    #     repo = "neovim";
    #     rev = "v0.10.2"; # Replace with the appropriate commit or tag
    #     sha256 = "1xi1f4msjm7csbwiymnj9i2m9q51hqk7q4m1ilr761qcarxf7a7s"; # You need to find the correct SHA256 hash for this commit      
    #   };
    # }))

    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; }) # Fonts
    pkgs.hyprcursor # Cursor Theme
    pkgs.hyprshot # Screenshots
    pkgs.wl-clipboard # Clipboard History
    pkgs.pavucontrol # Volume Control
    pkgs.networkmanager # Network Manager
    pkgs.wezterm # Based terminal

    pkgs.eza # Better LS
    pkgs.btop # Process Manager


    pkgs.spotify # Music
    pkgs.discord # ...
    pkgs.neofetch # System Info flexing
    pkgs.obs-studio # Screen Recorder
    pkgs.vlc # Video Player



    # Utilities
    pkgs.fd # Finder
    pkgs.ripgrep # Search
    pkgs.flyctl #Fly.io CLI


    # --- Erlang & Gleam ---
    pkgs.erlang_27 # Erlang (really just for gleam...)
    pkgs.rebar3 # Rebar3 (really just for Gleam...)
    pkgs.gleam # Gleam

    # --- Go ---
    pkgs.go 
    pkgs.gopls 
    pkgs.gotools 
    # pkgs.goimports
    pkgs.air
    pkgs.go-migrate
    pkgs.templ
    pkgs.sqlc

    # --- Rust ---
    pkgs.cargo
    pkgs.rust-analyzer


    # --- JS/NodeJS ---
    pkgs.nodejs_22
    pkgs.typescript
    pkgs.prettierd
    pkgs.nodePackages_latest.typescript-language-server
    pkgs.nodePackages_latest.svelte-language-server # Sveltekit LSP :)

    # --- Python ---
    pkgs.python3 
    pkgs.pyright
    pkgs.isort
    pkgs.black
    pkgs.ruff


    # --- Lua ---
    pkgs.lua
    pkgs.luajitPackages.luarocks-nix
    pkgs.lua-language-server
    pkgs.stylua
    pkgs.luajitPackages.jsregexp

    # --- Zig ---
    pkgs.zig
    pkgs.zls

    # --- C/C++ Compiler ---
    pkgs.libgccjit # GNU Compiler Collection
    pkgs.clang-tools
    pkgs.rocmPackages_5.llvm.clang # C/C++ Compiler
    pkgs.gnumake42 # GNU Make

    # --- Dotnet ---
    pkgs.dotnetCorePackages.sdk_8_0_2xx 
    pkgs.csharp-ls


    # --- SQL ---
    pkgs.sqls
    # pkgs.sqlfmt
    pkgs.postgresql_16_jit
    


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kusa/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
