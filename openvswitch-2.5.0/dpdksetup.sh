export OVS_DIR=/extra_drive_sda7/virtio/openvswitch-2.5.0
export DPDK_DIR=/extra_drive_sda7/virtio/dpdk-2.2.0

export DPDK_BUILD=$DPDK_DIR/x86_64-ivshmem-linuxapp-gcc/
cd $DPDK_DIR
make install T=x86_64-ivshmem-linuxapp-gcc
cd $OVS_DIR


export DPDK_BUILD=$DPDK_DIR/x86_64-native-linuxapp-gcc/
cd $DPDK_DIR
make install T=x86_64-native-linuxapp-gcc
cd $OVS_DIR
