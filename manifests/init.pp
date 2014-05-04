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
  $package_name         = $magento::params::package_name,
  $service_name         = $magento::params::service_name,
  $ensure               = $magento::params::ensure,
) inherits magento::params {

  anchor {'magento::begin': }
  anchor {'magento::end': }

  # validate parameters here

  # ensure
  if ! ($ensure in [ 'present', 'absent' ]) {
    fail("\"${ensure}\" is not a valid ensure parameter value")
  }

  class { 'magento::install': } ->
  class { 'magento::config': } ~>
  class { 'magento::service': } ->
  Class['magento']
}
