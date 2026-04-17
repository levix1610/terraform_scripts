# variable to hold all vm details


k8s_cluster_nodes = {
    "vmus-k8s-01" = { vmid = 101052, name = "vmus-dev-k8s-01", prime_nic = "02:00:10:ed:f7:77" },
    "vmus-k8s-02" = { vmid = 101053, name = "vmus-dev-k8s-02", prime_nic = "02:00:10:1a:0f:a8" },
    "vmus-k8s-03" = { vmid = 101054, name = "vmus-dev-k8s-03", prime_nic = "02:00:10:ca:e4:49" },
    "vmus-k8s-04" = { vmid = 101055, name = "vmus-dev-k8s-04", prime_nic = "02:00:10:37:66:03" },
    "vmus-k8s-05" = { vmid = 101056, name = "vmus-dev-k8s-05", prime_nic = "02:00:10:83:ae:7c" }
  
}

    proxmox_node = "pmx-mr-01"
    ssh_pub_file = "~/.ssh/microk8s_test_key.pub"
    template_id = 350 # march 2026
    vm_datastore = "pmx-mr-01-nvme"
    vlan_id_primary = 500
 