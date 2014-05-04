# == Class magento::install
#
class magento::install {

  package { $magento::package_name:
    ensure => present,
  }

  exec { 'create_package_dir_elasticsearch':
          cwd     => '/tmp',
          path    => ['/usr/bin', '/bin'],
          command => "printf '${mysql_root}' > log.log",
          creates => "/tmp/log.log";
        }

}
