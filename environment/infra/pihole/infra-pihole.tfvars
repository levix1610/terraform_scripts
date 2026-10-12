# Variables to build out the pihole server

# All variables that must be defined    
    proxmox_node        = "pmx-mr-01"
    ssh_pub_file        = "~/.ssh/powers_infra.pub"
    template_id         = 1000 # Ubuntu 26.04 LTS
    vm_datastore        = "pmx_mr_01_nvme"
    vlan_id             = 10
    vm_name             = "vmus-infra-phi-01"
    mac_address         = "02:00:10:f2:11:d4"
    cpu_cores           = 2
    disk_size           = 30
    vm_id               = 10102
    memory              = 2048