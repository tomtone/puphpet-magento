# == Class magento::service
#
# This class is meant to be called from magento
# It ensure the service is running
#
class magento::service {

  service { $magento::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
