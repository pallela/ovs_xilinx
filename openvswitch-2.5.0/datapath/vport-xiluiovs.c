/*
 * Copyright (c) Xilinx, Inc.
*/

#include "vport.h"

static struct vport *xiluiovs_vport_create(const struct vport_parms *parms)
{
	
}

static void xiluiovs_destroy(struct vport *vport)
{

}

static int xiluiovs_send(struct sk_buff *skb)
{

}

static struct vport_ops ovs_xiluiovs_vport_ops = {
        .type           = OVS_VPORT_TYPE_NETDEV,
        .create         = xiluiovs_vport_create,
        .destroy        = xiluiovs_destroy,
        .send           = xiluiovs_send,
};

 
int __init xiluiovs_init(void)
{
        return ovs_vport_ops_register(&ovs_xiluiovs_vport_ops);
}

void xilu_iovs_exit(void)
{
        ovs_vport_ops_unregister(&ovs_xiluiovs_vport_ops);
}

