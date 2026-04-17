# variable to hold all vm details


k8s_cluster_nodes = {
    "vmus-k8s-01" = { vmid = 10150210, name = "vmus-prod-k8s-01", prime_nic = "02:00:10:7d:0a:54" },
    "vmus-k8s-02" = { vmid = 10150211, name = "vmus-prod-k8s-02", prime_nic = "02:00:10:8e:f5:a0" },
    "vmus-k8s-03" = { vmid = 10150212, name = "vmus-prod-k8s-03", prime_nic = "02:00:10:c9:c7:53" },
    "vmus-k8s-04" = { vmid = 10150213, name = "vmus-prod-k8s-04", prime_nic = "02:00:10:24:93:f4" },
    "vmus-k8s-05" = { vmid = 10150214, name = "vmus-prod-k8s-05", prime_nic = "02:00:10:1d:b7:2c" },
    "vmus-k8s-06" = { vmid = 10150215, name = "vmus-prod-k8s-06", prime_nic = "02:00:10:43:6c:14" },
    "vmus-k8s-07" = { vmid = 10150216, name = "vmus-prod-k8s-07", prime_nic = "02:00:10:3f:a6:7c" }
  
}

    proxmox_node = "pmx-wc-01"
    ssh_pub_file = "~/.ssh/microk8s_prod_key.pub"
    template_id = 350 # march-23-2026 image
    vm_datastore = "local-lvm"
    vlan_id_primary = 400
 