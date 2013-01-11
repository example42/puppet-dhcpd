# Class: dhcpd::params
#
# This class defines default parameters used by the main module class dhcpd
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to dhcpd class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class dhcpd::params {

  $source_init = ''
  $template_init = ''


  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'dhcpd3-server',
    /(?i:SLES|OpenSuSE)/      => 'dhcp-server',
    default                   => 'dhcp',
  }

  $service = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'dhcpd3-server',
    default                   => 'dhcpd',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'dhcpd3',
    default                   => 'dhcpd',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'dhcpd',
  }

  $config_dir = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/dhcp3',
    /(?i:SLES|OpenSuSE)/      => '/etc/dhcpd.d',
    default                   => '/etc/dhcp',
  }

  $config_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/dhcp3/dhcpd.conf',
    default                   => '/etc/dhcpd.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/dhcp3-server',
    default                   => '/etc/sysconfig/dhcpd',
  }

  $pid_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/run/dhcp3-server/dhcpd.pid',
    default                   => '/var/run/dhcpd.pid',
  }

  $data_dir = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/lib/dhcp3',
    /(?i:SLES|OpenSuSE)/      => '/var/lib/dhcp',
    default                   => '/var/lib/dhcpd',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log',
  }

  $log_file = $::operatingsystem ? {
    default => '',
  }

  $port = '67'
  $protocol = 'udp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
