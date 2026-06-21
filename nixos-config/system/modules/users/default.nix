{ pkgs, ... }:

{
  users.users.kiichi = {
    isNormalUser = true;
    initialPassword = "nixos";
    description = "kiichi someya";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };
}
