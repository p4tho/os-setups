{ lib, ... }:

{

    # virt-manager setup
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["kiichi"];
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    # guest agent
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;

}
