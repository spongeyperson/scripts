#!/bin/sh

# Unbind from Current Driver
echo -n "0000:0e:00.0" > /sys/bus/pci/devices/0000:0e:00.0/driver/unbind || echo "1070 Unbinding Failed"
echo -n "0000:0e:00.1" > /sys/bus/pci/devices/0000:0e:00.1/driver/unbind || echo "1070 Audio Unbinding Failed"

# Bind to VFIO-PCI
#echo -n "10de 1b80" > /sys/bus/pci/drivers/vfio-pci/new_id
#echo -n "10de 10f0" > /sys/bus/pci/drivers/vfio-pci/new_id
#echo -n "0000:0c:00.0" > /sys/bus/pci/drivers/vfio-pci/bind
#echo -n "0000:0c:00.1" > /sys/bus/pci/drivers/vfio-pci/bind
