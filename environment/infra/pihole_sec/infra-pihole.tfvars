# Variables to build out the pihole server

# All variables that must be defined    
    proxmox_node        = "pmx-mr-01"
    ssh_pub_file        = "~/.ssh/powers_infra.pub"
    template_id         = 500 # Change to new image for oct 25
    vm_datastore        = "pmx_mr_01_nvme"
    vlan_id             = 10
    vm_name             = "vmus-infra-phi-02"
    mac_address         = "02:00:10:f6:8f:3c"
    cpu_cores           = 2
    disk_size           = 30
    vm_id               = 10103
    memory              = 2048