# variable to hold all vm details


k8s_cluster_nodes = {
    "vmus-k8s-01" = { vmid = 101042, name = "vmus-prod-k8s-01", prime_nic = "02:00:10:dd:9c:40" },
    "vmus-k8s-02" = { vmid = 101043, name = "vmus-prod-k8s-02", prime_nic = "02:00:10:1e:91:4c" },
    "vmus-k8s-03" = { vmid = 101044, name = "vmus-prod-k8s-03", prime_nic = "02:00:10:ca:cb:aa" },
    "vmus-k8s-04" = { vmid = 101045, name = "vmus-prod-k8s-04", prime_nic = "02:00:10:cf:7a:ca" },
    "vmus-k8s-05" = { vmid = 101046, name = "vmus-prod-k8s-05", prime_nic = "02:00:10:6b:a5:04" }
  
}

    proxmox_node = "pmx-gr-02"
    ssh_pub_file = "~/.ssh/microk8s_prod_key.pub"
    template_id = 350 # march-23-2026 image
    vm_datastore = "zfs_pool"
    vlan_id_primary = 400
 