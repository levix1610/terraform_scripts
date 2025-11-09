# Variables to build out the pihole server

# All variables that must be defined    
    proxmox_node        = "pmx-test-wc-01"
    ssh_pub_file        = "~/.ssh/powers_prod.pub"
    template_id         = 300 # Change to new image for oct 25
    vm_datastore        = "pmx-test-nvme"
    vlan_id             = 100
    vm_name             = "vmus-test-phi-01"
    mac_address         = "02:00:10:47:46:36"
    cpu_cores           = 2
    disk_size           = 30
    vm_id               = 10100250
    memory              = 2048