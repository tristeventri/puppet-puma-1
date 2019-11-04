# puma::params class
class puma::params {
  $puma_user          = 'puma'
  $min_threads        = 1
  $max_threads        = 16
  $port               = 9292
  $bind_ip            = '0.0.0.0'
  $workers            = 1
  $init_active_record = false
  $preload_app        = true
  $rails_env          = $environment
  $rvm_ruby           = false
  $restart_command    = 'puma'
  $service_ensure      = running
  $service_enable      = true
  $worker_boot_timeout = undef

  if $::nx_daemon_user {
    $www_user = $::nx_daemon_user # Assume nginx user if available
  }

  case $::osfamily {
    'Debian': {
      $app_root_spf      = '/var/www/%s'
      $puma_pid_path_spf    = '/var/run/%s/puma.pid'
      $puma_socket_path_spf  = '/var/run/%s/puma.socket'
      $puma_config_path_spf  = '/etc/%s/puma.rb'
      $puma_stdout_log_path_spf = '/var/log/puma/%s.puma.stdout.log'
      $puma_stderr_log_path_spf = '/var/log/puma/%s.puma.stderr.log'
      $init_script_spf    = '/etc/init.d/%s'
      unless $www_user {
        $www_user       = 'www-data' # generic debian web-server user
      }
      case $::operatingsystem {
        'Ubuntu': {
          if $::operatingsystemmajrelease >= '15.04' {
            $service_type   = 'systemd'
          } else {
            $service_type   = 'upstart'
          }
        }
        default: {
          $service_type   = 'sysv'
        }
      }
    }
    default: {
      fail("${::osfamily} is not supported - \
           now would be a great time to look into using module_data")
    }

  }
}
