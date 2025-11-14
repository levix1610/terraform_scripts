# Variables to build out the bookstack server

# All variables that must be defined    
    proxmox_node        = "pmx-mr-01"
    ssh_pub_file        = "~/.ssh/powers_prod.pub"
    template_id         = 300 # Change to new image for oct 25
    vm_datastore        = "pmx-mr-01_nvme"
    vlan_id             = 150
    vm_name             = "vmus-prod-bks-01"
    mac_address         = "02:00:10:40:52:50"
    cpu_cores           = 2
    disk_size           = 35
    vm_id               = 1015041
    memory              = 2048
    