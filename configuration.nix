# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./apps/vim/vim.nix
      ./apps/tmux/tmux.nix
#       ./apps/zsh/nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/nvme0n1p2";
      preLVM = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;
  networking.networkmanager.enable = true;
  networking.resolvconf.dnsExtensionMechanism = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Set your time zone.
    time.timeZone = "Australia/Brisbane";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
      dmenu
      pciutils
      firefox
      git
      htop
      networkmanagerapplet
      ranger
      termite
      tmux
      #vim
      wget 
      which
      xorg.xrandr
      teamviewer
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
    sound.enable = true;
    hardware.pulseaudio.enable = true;
    hardware.nvidia = {
      modesetting.enable = true;
      optimus_prime = {
        enable = true;
        nvidiaBusId = "PCI:2:0:0";
        intelBusId = "PCI:0:2:0";
      };
    };

  # Enable the X11 windowing system.
    


  # Enable touchpad support.

    
    
    services = {
      xserver = {
        enable          = true;
        dpi             = 96;
        videoDrivers    = [ "nvidia" ];
        xkbOptions      = "caps:swapescape";
        layout          = "us";
        libinput.enable = true;
        displayManager.sddm.enable = true;
        desktopManager.plasma5.enable = true;
      #  windowManager.xmonad = {
      #    config = builtins.readFile ./services/xmonad/xmonad.hs;
      #    enable = true;
      #    enableContribAndExtras = true;
      #    extraPackages = hpkgs: [           # Open configuration for additional Haskell packages.
      #      hpkgs.xmonad-contrib             # Install xmonad-contrib.
      #      hpkgs.xmonad-extras              # Install xmonad-extras.
      #      hpkgs.xmonad                     # Install xmonad itself.
      #      hpkgs.xmonad-wallpaper
      #    ];
      #  };
      #desktopManager.default      = "none";
      #desktopManager.xterm.enable = false;
      #windowManager.default       = "xmonad";
    };
  };

  # Enable the KDE Desktop Environment.

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.m0n4d = {
      createHome   = true;
      isNormalUser = true;
      extraGroups  = [ "wheel" "video" "audio" "disk" "networkmanager" ]; # Enable ‘sudo’ for the user.
      uid          = 1000;
      group        = "users";
      home         = "/home/m0n4d";
    };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

