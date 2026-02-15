# Variables to build out the pihole server

# All variables that must be defined    
    proxmox_node        = "pmx-wc-02"
    ssh_pub_file        = "~/.ssh/powers_prod.pub"
    template_id         = 300 # Change to new image for oct 25
    vm_datastore        = "pmx_mr_01_nvme"
    vlan_id             = 100
    vm_name             = "vmus-test-pst-01"
    mac_address         = "02:00:10:fd:b2:ae"
    cpu_cores           = 2
    disk_size           = 30
    vm_id               = 1010045
    memory              = 2048