# variable to hold all vm details


k8s_cluster_nodes = {
    "vmus-k8s-01" = { vmid = 101062, name = "vmus-prod-k8s-01", prime_nic = "02:00:10:39:5a:23" },
    "vmus-k8s-02" = { vmid = 101063, name = "vmus-prod-k8s-02", prime_nic = "02:00:10:ab:a2:95" },
    "vmus-k8s-03" = { vmid = 101064, name = "vmus-prod-k8s-03", prime_nic = "02:00:10:2d:21:0c" },
    "vmus-k8s-04" = { vmid = 101065, name = "vmus-prod-k8s-04", prime_nic = "02:00:10:f6:84:f1" },
    "vmus-k8s-05" = { vmid = 101066, name = "vmus-prod-k8s-05", prime_nic = "02:00:10:c7:22:b9" }
  
}

    proxmox_node = "pmx-gr-01"
    ssh_pub_file = "~/.ssh/microk8s_prod_key.pub"
    template_id = 1000 # ubuntu 26.04.1
    vm_datastore = "ssd_zfs"
    vlan_id_primary = 600
 