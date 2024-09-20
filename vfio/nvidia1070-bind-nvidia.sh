#!/bin/sh

# Rebind GPU to Nvidia Driver
virsh nodedev-reattach pci_0000_0e_00_0
virsh nodedev-reattach pci_0000_0e_00_1

# Load Nvidia Modules
modprobe nvidia
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia_drm

# Rebind VT Consoles
#echo 1 > /sys/class/vtconsole/vtcon0/bind
# Some machines might have more than 1 virtual console. Add a line for each corresponding VTConsole
#echo 1 > /sys/class/vtconsole/vtcon1/bind

nvidia-xconfig --query-gpu-info > /dev/null 2>&1
echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# Unbind from Current Driver
#echo -n "0000:0e:00.0" > /sys/bus/pci/devices/0000:0e:00.0/driver/unbind || echo "1070 Unbinding Failed"
#echo -n "0000:0e:00.1" > /sys/bus/pci/devices/0000:0e:00.1/driver/unbind || echo "1070 Audio Unbinding Failed"

# Bind to VFIO-PCI
#echo -n "10de 1b80" > /sys/bus/pci/drivers/vfio-pci/new_id
#echo -n "10de 10f0" > /sys/bus/pci/drivers/vfio-pci/new_id
#echo -n "0000:0c:00.0" > /sys/bus/pci/drivers/vfio-pci/bind
#echo -n "0000:0c:00.1" > /sys/bus/pci/drivers/vfio-pci/bind
