variable "vpc_name" {
  type        = string
  description = "Please provide a VPC name"
  default     = ""
}

variable "region" {
  type        = string
  description = "Please provide a region"
  default     = ""
}

variable "zone" {
  type        = string
  description = "Please provide a zone"
  default     = ""
}

variable "instance_name" {
  description = "Please provide an instance_name"
  type        = string
  default     = ""
}

variable "machine_type" {
  description = "Please provide a machine_type"
  type        = string
  default     = ""
}

variable "image" {
  description = "Please provide an image"
  type        = string
  default     = ""
}

variable "firewall_name" {
  description = "Please provide a firewall_name for instances"
  type        = string
  default     = ""
}



variable "target-pool-name" {
  description = "Please provide a target-pool-name"
  type        = string
  default     = ""
}

variable "autoscaler" {
  description = "Please provide an autoscaler"
  type        = string
  default     = ""
}

variable "max_replicas" {
  description = "Please provide a max_replicas"
  type        = string
  default     = ""

}

variable "min_replicas" {
  description = "Please provide a min_replicas"
  type        = string
  default     = ""

}


variable "cooldown_period" {
  description = "Please provide a cooldown_period"
  type        = string
  default     = ""

}

variable "target" {
  description = "Please provide a target"
  type        = string
  default     = ""
}


variable "instance_group_manager_name" {
  description = "Please provide an instance_group_manager_name"
  type        = string
  default     = ""
}

variable "instance_template_name" {
  description = "Please provide an instance_template_name"
  type        = string
  default     = ""
}

variable "source_image" {
  description = "Please provide a source_image"
  type        = string
  default     = ""
}

variable "network_tags" {
  description = "Please provide a network_tags"
  type        = string
  default     = ""
}







