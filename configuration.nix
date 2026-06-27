# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true; # nmcli or nmtui.
  };

  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };


  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };


  services.xserver.displayManager.lightdm.enable = false;
  services.displayManager.enable = false;

  services = {
    xserver = {
      enable = true;
      # autorun = false;
      displayManager.startx.enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      windowManager.i3.enable = true;
      xkb.layout = "pl";

    };
    # displayManager.ly.enable = true;

    libinput = {
      # enable = true;
      touchpad = {
        naturalScrolling = true;
        tapping = false;
      };
    };

    chrony.enable = true;
    fwupd.enable = true;
  };

  users.users.etheryen = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;


  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "obsidian"
  ];

  environment.systemPackages = with pkgs; [
    # Basics
    git
    vim
    wget
    zip
    unzip

    # Workflow
    neovim
    nodejs
    python3
    cargo
    tree-sitter
    fd
    fzf
    ripgrep

    # Terminal
    alacritty

    # Misc
    stow
    xclip
    flameshot
    feh
    xss-lock

    # C stuff
    gcc
    clang
    binutils
    gnumake

    # Display
    brightnessctl
    redshift

    # Notes
    obsidian

    # Larp
    fastfetch

    # Passwords
    # bitwarden-desktop
    polybar
  ];

  fonts = {
    fontconfig.allowBitmaps = true;
    packages = with pkgs; [
      iosevka
      cozette
      monocraft
      miracode
      departure-mono
      terminus_font
      ultimate-oldschool-pc-font-pack
    ];
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "etheryen";
    dataDir = "/home/etheryen";
  };

  # Dynamic libraries fix
  programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # networking.nat.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

