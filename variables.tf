variable "location" {
  description = "Location of VM"
  default     = "canadacentral"
}

variable "tags" {
  description = "Tags that will be associated to VM resources"
  default = {
    "exampleTag1" = "SomeValue1"
    "exampleTag1" = "SomeValue2"
  }
}

variable "env" {
  description = "4 chars env name"
  type        = string
}

variable "serverType" {
  description = "3 chars server type"
  type        = string
  default     = "SRV"
}

variable "userDefinedString" {
  description = "User defined portion of the server name. Up to 8 chars minus the postfix lenght"
  type        = string
}

variable "postfix" {
  description = "(Optional) Desired postfix value for the name. Max 3 chars."
  type        = string
  default     = ""
}

variable "data_disk_sizes_gb" {
  description = "List of data disk sizes in gigabytes required for the VM. EG.: If 3 data disks are required then data_disk_size_gb might look like [40,100,60] for disk 1 of 40 GB, disk 2 of 100 GB and disk 3 of 60 GB"
  default     = []
}

variable "subnet" {
  description = "subnet object to which the VM NIC will connect to"
}

variable "dnsServers" {
  description = "List of DNS servers IP addresses to use for this NIC, overrides the VNet-level server list"
  default     = null
}
variable "use_nic_nsg" {
  default = true
}
variable "nic_enable_ip_forwarding" {
  description = "Enables IP Forwarding on the NIC."
  default     = false
}
variable "nic_enable_accelerated_networking" {
  description = "Enables Azure Accelerated Networking using SR-IOV. Only certain VM instance sizes are supported."
  default     = false
}
variable "nic_ip_configuration" {
  description = "Defines how a private IP address is assigned. Options are Static or Dynamic. In case of Static also specifiy the desired privat IP address"
  default = {
    private_ip_address            = [null]
    private_ip_address_allocation = ["Dynamic"]
  }
}

variable "load_balancer_backend_address_pools_ids" {
  description = "List of Load Balancer Backend Address Pool IDs references to which this NIC belongs"
  default     = []
}

variable "security_rules" {
  type = list(map(string))
  default = [
    {
      name                       = "AllowAllInbound"
      description                = "Allow all in"
      access                     = "Allow"
      priority                   = "100"
      protocol                   = "*"
      direction                  = "Inbound"
      source_port_ranges         = "*"
      source_address_prefix      = "*"
      destination_port_ranges    = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowAllOutbound"
      description                = "Allow all out"
      access                     = "Allow"
      priority                   = "105"
      protocol                   = "*"
      direction                  = "Outbound"
      source_port_ranges         = "*"
      source_address_prefix      = "*"
      destination_port_ranges    = "*"
      destination_address_prefix = "*"
    }
  ]
}

variable "asg" {
  description = "ASG resource to join the NIC to"
  default     = null
}

variable "public_ip" {
  description = "Should the VM be assigned public IP(s). True or false."
  default     = false
}

variable "resource_group" {
  description = "Resourcegroup object that will contain the VM resources"
}

variable "admin_username" {
  description = "Name of the VM admin account"
}

variable "admin_password" {
  description = "Name of the VM admin account"
}

variable "os_managed_disk_type" {
  default = "Standard_LRS"
}

variable "data_managed_disk_type" {
  default = "Standard_LRS"
}

variable "vm_size" {
  description = "Specifies the size of the Virtual Machine. Eg: Standard_F4"
}

variable "storage_image_reference" {
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

variable "plan" {
  description = "An optional plan block"
  default     = null
}

variable "storage_os_disk" {
  default = {
    caching       = "ReadWrite"
    create_option = "FromImage"
    os_type       = null
    disk_size_gb  = null
  }
}

variable "license_type" {
  description = "BYOL license type for those with Azure Hybrid Benefit"
  default     = null
}

variable "availability_set_id" {
  description = "Sets the id for the availability set to use for the VM"
  default     = null
}

variable "boot_diagnostic" {
  default = false
}

variable "priority" {
  description = "Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created."
  default     = "Regular"
}

variable "eviction_policy" {
  description = "Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. At this time the only supported value is Deallocate. Changing this forces a new resource to be created."
  default     = "Deallocate"
}