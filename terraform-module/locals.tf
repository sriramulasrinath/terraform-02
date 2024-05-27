locals {
  resource_name = "${var.project_name}-${var.environment}"
}
locals {
  az_names = slice(data.availability_zones.available.names, 0, 2)
}