# Variables to build out the pihole server

# All variables that must be defined    
    proxmox_node        = "pmx-mr-01"
    ssh_pub_file        = "~/.ssh/powers_infra.pub"
    template_id         = 1000 # Ubuntu 26.04 LTS
    vm_datastore        = "SSD"
    vlan_id             = 10
    vm_name             = "vmus-infra-ans-01"
    mac_address         = "02:00:10:0d:2f:a7"
    cpu_cores           = 2
    disk_size           = 30
    vm_id               = 10105
    memory              = 2048