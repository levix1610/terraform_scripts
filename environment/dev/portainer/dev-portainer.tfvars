# Variables to build out the pihole server

# All variables that must be defined    
    proxmox_node        = "pmx-mr-01"
    ssh_pub_file        = "~/.ssh/powers_prod.pub"
    template_id         = 350 # Change to new image for oct 25
    vm_datastore        = "pmx-mr-01-nvme"
    vlan_id             = 100
    vm_name             = "vmus-test-ptr-01"
    mac_address         = "BC:24:11:02:FD:1D"
    cpu_cores           = 2
    disk_size           = 40
    vm_id               = 1010095
    memory              = 2048