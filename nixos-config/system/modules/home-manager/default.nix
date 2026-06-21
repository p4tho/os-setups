{ pkgs, ... }:

let
  programsDir = ./programs;
  dirEntries = builtins.readDir programsDir;

  programImports =
    builtins.map
      (name: programsDir + "/${name}/default.nix")
      (builtins.filter
        (name:
          dirEntries.${name} == "directory" &&
          builtins.pathExists (programsDir + "/${name}/default.nix"))
        (builtins.attrNames dirEntries));
in
{
  # Desktop environment
  programs.hyprland.enable = true;
  services.desktopManager.plasma6.enable = false;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  security.pam.services.login.kwallet.enable = false;
  security.pam.services.sddm.kwallet.enable = false;
  programs.dconf.enable = true;
  programs.bash.enable = true;
  programs.bash.shellAliases.zed = "zeditor";

  # File system
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  home-manager.users.kiichi = {
    imports = programImports;
    
    services.ssh-agent.enable = true;
    services.ssh-agent.defaultMaximumIdentityLifetime = 3600;
    
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };

    home.packages = with pkgs; [
      librewolf
      nmap
      metasploit
      john
      netcat
      wireshark
      burpsuite

      # Hyprland
      wofi
      wlogout
      mako
      hyprpaper
      networkmanagerapplet
      nerd-fonts.jetbrains-mono
      brightnessctl
      playerctl

      # DE Apps
      thunar
      thunar-volman
      grim
      slurp
      swappy
      imv
      bibata-cursors
    ];

    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };

    home.stateVersion = "25.11";
  };
}
