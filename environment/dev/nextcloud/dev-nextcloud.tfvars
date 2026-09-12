# Variables to build out the pihole server

# All variables that must be defined    
    proxmox_node        = "pmx-gr-02"
    ssh_pub_file        = "~/.ssh/powers_prod.pub"
    template_id         = 350 # Change to new image for oct 25
    vm_datastore        = "SSD_02_02"
    vlan_id             = 500
    vm_name             = "vmus-dev-nxt-01"
    mac_address         = "02:00:10:9e:6f:66"
    cpu_cores           = 4
    disk_size           = 30
    vm_id               = 1010527
    memory              = 4096