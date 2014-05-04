# == Class magento::params
#
# This class is meant to be called from magento
# It sets variables according to platform
#
class magento::params {

  # ensure
  $ensure = 'present'

  case $::osfamily {
    'Debian': {
      $package_name = 'magento'
      $service_name = 'magento'
    }
    'RedHat', 'Amazon': {
      $package_name = 'magento'
      $service_name = 'magento'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
