# == Class: selenium::params
#
# This class should be considered private.
#
#
class selenium::params {
  $display          = ':0'
  $user             = 'selenium'
  $manage_user      = true
  $group            = $user
  $manage_group     = true
  $install_root     = '/opt/selenium'
  $server_options   = '-Dwebdriver.enable.native.events=1'
  $hub_options      = '-role hub'
  $node_options     = "${server_options} -role node"
  $java             = 'java'
  $version          = '3.7.1'
  $default_hub      = 'http://localhost:4444/grid/register'
  $default_classpath = []
  case $::osfamily {
    'redhat': {
      case $::operatingsystemmajrelease {
        6: {
          $initsystem = 'init.d'
        }
        2018: {
          $initsystem = 'init.d'
        }
        default: {
          $initsystem = 'systemd'
        }
      }
    }
    'debian': {
      $initsystem = 'init.d'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
