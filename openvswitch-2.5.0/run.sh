#mkdir /dev/hugepages
#umount /dev/hugepages
#mount -t hugetlbfs -o pagesize=2M size=256M  /dev/hugepages

rm -rf /usr/local/etc/openvswitch
mkdir -p /usr/local/etc/openvswitch
ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema
ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
                     --remote=db:Open_vSwitch,Open_vSwitch,manager_options \
                     --private-key=db:Open_vSwitch,SSL,private_key \
                     --certificate=db:Open_vSwitch,SSL,certificate \
                     --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
                     --pidfile --detach
ovs-vsctl --no-wait init
export DB_SOCK=/usr/local/var/run/openvswitch/db.sock
#ovs-vswitchd --dpdk -c 0x1 -n 4 -- unix:$DB_SOCK --pidfile --detach --log-file=/tmp/ovslog.log
#ovs-vswitchd --dpdk -c 0x1 -n 4 -- unix:$DB_SOCK --pidfile --log-file=/tmp/ovslog.log
ovs-vswitchd --dpdk -c 0x1 -n 4 --socket-mem 1024,0 -- unix:$DB_SOCK --pidfile 

