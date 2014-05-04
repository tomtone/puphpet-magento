# == Class: magento
#
# Full description of class magento here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class magento (
  $package_name = $magento::params::package_name,
  $service_name = $magento::params::service_name,
) inherits magento::params {

  # validate parameters here

  class { 'magento::install': } ->
  class { 'magento::config': } ~>
  class { 'magento::service': } ->
  Class['magento']
}
