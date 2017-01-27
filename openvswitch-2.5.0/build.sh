export OVS_DIR=/extra_drive_sda7/virtio/openvswitch-2.5.0
export DPDK_DIR=/extra_drive_sda7/virtio/dpdk-2.2.0
#export DPDK_BUILD=$DPDK_DIR/x86_64-ivshmem-linuxapp-gcc/
export DPDK_BUILD=$DPDK_DIR/x86_64-native-linuxapp-gcc/

./boot.sh
./configure --with-dpdk=$DPDK_BUILD
make -j4
make install 

mkdir /dev/hugepages
mount -t hugetlbfs -o pagesize=2M size=1024M  /dev/hugepages
