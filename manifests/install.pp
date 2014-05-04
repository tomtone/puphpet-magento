# == Class magento::install
#
class magento::install {

  package { $magento::package_name:
    ensure => present,
  }
}
