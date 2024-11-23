#One page introduction to Nix, the language - https://github.com/tazjin/nix-1p

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:

# In order to be able to easily download packages from unstable channel, we have three options:
# flakes, channels and fetching tarball. I am choosing fetching tarball as it is the most simplest
# and remains in this configuration file only. Now we can install either stable or unstable packages. 
# Tarball is downloaded only once and then cached, so when you rebuild - it will not be downloaded again,
# unless there’s been a change in the URL or if it needs to invalidate the cache 
# Example:
# android-studio - stable channel
# unstable.android-studio - unstable channel
let
  unstableTarball = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  unstable = import unstableTarball { config = config.nixpkgs.config; };





 # # Import the android-nixpkgs repository to use androidenv
 #  androidNixpkgs = pkgs.callPackage (import (builtins.fetchGit {
 #    url = "https://github.com/tadfisher/android-nixpkgs.git";
 #  })) {};
 #  androidenv = androidNixpkgs.androidenv;  # Make sure to define androidenv here
  
     #Add Android SDK setup
     android-nixpkgs = pkgs.callPackage (import (builtins.fetchGit {
       url = "https://github.com/tadfisher/android-nixpkgs.git";
     })) {
       channel = "stable";
     };
     # Create an Android SDK package with selected components
     androidSdk = android-nixpkgs.sdk (sdkPkgs: with sdkPkgs; [
       cmdline-tools-latest
       build-tools-34-0-0
       platform-tools
       platforms-android-34
       emulator
     ]);  
    # androidComposition = androidenv.composeAndroidPackages {
    #     cmdLineToolsVersion = "8.0";
    #     toolsVersion = "26.1.1";
    #     platformToolsVersion = "30.0.5";
    #     buildToolsVersions = [ "30.0.3" ];
    #     includeEmulator = false;
    #     emulatorVersion = "30.3.4";
    #     platformVersions = [ "28" "29" "30" ];
    #     includeSources = false;
    #     includeSystemImages = false;
    #     systemImageTypes = [ "google_apis_playstore" ];
    #     abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
    #     cmakeVersions = [ "3.10.2" ];
    #     includeNDK = true;
    #     ndkVersions = ["22.0.7026061"];
    #     useGoogleAPIs = false;
    #     useGoogleTVAddOns = false;
    #     includeSDKManager = true;
    #     includeAVDManager = true;
    #     includeExtras = [
    #       "extras;google;gcm"
    #     ];
    #   };


  
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  services.xserver.enable = true;
  services.dbus.enable = true;

  # Enable the GNOME Desktop Environment.
    # services.xserver.displayManager.gdm.enable = true;
    # services.xserver.desktopManager.gnome.enable = true;

  # Enable Cinnamon Desktop
   services.xserver.desktopManager.cinnamon.enable = true;


  # Enable automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };        

#HYPERLND tiling manager test

 # Enable Hyprland
  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };

# environment.sessionVariables = {
#   NIXOS_OZONE_WAYLAND = "1"
# }

  
# Enable fonts needed for a nice Hyprland experience
  # fonts.packages = with pkgs; [
  #   (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  # ];
  
	# for debugging purposes
	# boot.kernel.sysctl = { "kernel.panic_on_oops" = true; };
	# boot.crashDump.enable = true;
	# boot.consoleLogLevel = 7;
	# boot.kernelParams = [ "loglevel=7" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #programs.fish.enable = true;
  #enable Android Debug Bridge
  programs.adb.enable = true;
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.git = {
    enable = true;
    config = {
      user.name = "Nikita0x";
      user.email = "klirmio21@gmail.com";
    };
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    withNodeJs = true;
  };
  #terminal multiplexer
  programs.tmux = {
    enable = true;
    clock24 = true;
  };
  #new browser but is very alpha
  programs.ladybird = {
    enable = true;
  };
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

# List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

 
 # libray for videos idk - required for some flutter apps or else crashes.
 # gotta fix in the future
 # https://nixos.wiki/wiki/GStreamer 
 gst_all_1.gstreamer                  # Core GStreamer library
 gst_all_1.gst-plugins-base           # Essential plugins
 gst_all_1.gst-plugins-good           # Good-quality plugins under LGPL
 gst_all_1.gst-plugins-bad            # Plugins not up to par yet
 gst_all_1.gst-plugins-ugly           # Plugins with problematic licenses
 gst_all_1.gst-libav                  # Libav-based plugins for multimedia   

  #OBS streaming
    (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      })


  
(pkgs.androidenv.emulateApp {
          name = "emulate-MyAndroidApp";
          platformVersion = "VanillaIceCream";
          abiVersion = "x86_64"; # armeabi-v7a, mips, x86_64
          systemImageType = "google_apis_playstore";
        })  
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # androidComposition.androidsdk
    androidSdk

    tldr

    unstable.zed-editor
    xorg.libX11
    xorg.libxcb
    xorg.libXrender
    xorg.libXext
    xorg.libXdamage
    xorg.libxkbfile
    #test internet speed
    speedtest-cli

    albert #keyboard launcher
    # figma-linux

    #useful for reverse engineering I guess?
    file
    binutils
    unixtools.xxd
    # arc-browser

    sublime-merge-dev #gui git
    unstable.code-cursor
    wget
    home-manager
    neofetch
    tree 
    btop
    telegram-desktop
    gnome.gnome-tweaks  
    xclip #to allow yank/copy in nvim 
    pwvucontrol # if problems with headphones - you can fix it here
    vscode
    unstable.android-studio
    pciutils
    python3
    python312Packages.pip 
    nodejs_22
    ripgrep
    fd
    lazygit
    tree-sitter
    gcc
    nerdfonts #fix broken icons in neovim
    fzf #cool fuzzy finder for terminal
    bat #like cat but with syntax highlight and more
    bun
    git
    yarn
    google-chrome
    filezilla
    postman
    go
    skypeforlinux
    gpick 
    simplescreenrecorder
    typescript
    gparted
    flameshot
    qbittorrent-qt5
    tor-browser
    calibre #reader for books
    prettierd # pretiter daemon needs to be installed for code formatting to be working in neovim (conform plugin)
    eslint_d
    stylua
    anydesk
    sass
    php83Packages.composer
    openjdk
    zip
    unzip
    screenkey #для вывода на экран кнопок
    inkscape
    krita
    kotlin

    #editors
    helix 
    emacs
    kakoune
    kakoune-lsp

    #ruby stuff
    ruby_3_3
    sqlite
    rubyPackages_3_3.websocket-driver

    #clojure stuff
    leiningen
    clojure
    clojure-lsp
    zig_0_11
    
    #c stuff
    raylib
    clang
    cmake
    ninja
    gcc

    # flutter stuff   
    dart
    # flutter309
    # unstable.flutterPackages-source.v3_26
    # unstable.flutterPackages-source.stable
    unstable.flutter326


    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    vscode-langservers-extracted 
    emmet-language-server 
    nodePackages.eslint
    rust-analyzer
    tailwindcss-language-server
    nodePackages_latest.vls 
    nodePackages_latest."@volar/vue-language-server"
    
 ];

  #enables nix-ld, a compatibility layer for dynamically linked executables.
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages

      # Add Sass-related libraries
         sass
         nodePackages.sass
         libsass
    ];
  
   # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true; 
   };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    # Modesetting is required for most Wayland compositors
    modesetting.enable = true;
    # Use the open source version of the NVIDIA kernel module
    # Only available on driver 515.43.04+
    open = false;
    # Enable the NVIDIA settings menu
    nvidiaSettings = true;
    # Choose the driver version
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    #Enable PRIME
    prime = {
      offload = {
         enable = true;
	 enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Enable networking
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
  };
  # Set your time zone.
  time.timeZone = "Europe/Kyiv";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };
	
#i3 Window manager 
	
	#  services.xserver.windowManager.i3 = {
	# 	enable = true;
	# 	extraPackages = with pkgs; [
	# 		dmenu
	# 		i3status
	# 		i3lock
	# 	];
	# };
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ua,ru";
    variant = "";
    options = "grp:alt_shift_toggle";  
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = false;


    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
	# services.xserver.libinput.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.nikita = {
    #shell = pkgs.fish;
    isNormalUser = true;
    description = "nikita";

    # - adbusers - https://nixos.wiki/wiki/Android#adb_setup
    # - kvm      - https://nixos.wiki/wiki/Android#hardware_acceleration
    extraGroups = [ "networkmanager" "wheel" "adbusers" "kvm" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "nikita";
  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.android_sdk.accept_license = true;
  
	
  
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
  # networking.firewall.allowedTCPPorts = [ 5173 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
