#!/bin/sh

# Unbind from Current Driver
#echo -n "0000:12:00.0" > /sys/bus/pci/devices/0000:12:00.0/driver/unbind || echo "GPU Unbinding Failed"
#echo -n "0000:12:00.1" > /sys/bus/pci/devices/0000:12:00.1/driver/unbind || echo "GPU Audio Unbinding Failed"

# Bind to VFIO-PCI
#echo -n "1002 73ff" > /sys/bus/pci/drivers/vfio-pci/new_id || echo "DEVID - GPU Binding ID Failed"
#echo -n "1002 ab28" > /sys/bus/pci/drivers/vfio-pci/new_id || echo "DEVID - GPU Audio Binding ID Failed"
echo -n "0000:12:00.0" > /sys/bus/pci/drivers/vfio-pci/bind || echo "GPU Binding ID Failed"
echo -n "0000:12:00.1" > /sys/bus/pci/drivers/vfio-pci/bind || echo "GPU Audio Binding ID Failed"
