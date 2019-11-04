# puma class
class puma (
  $puma_user                = $puma::params::puma_user,
  $www_user                 = $puma::params::www_user,
  $min_threads              = $puma::params::min_threads,
  $max_threads              = $puma::params::max_threads,
  $port                     = $puma::params::port,
  $workers                  = $puma::params::workers,
  $init_active_record       = $puma::params::init_active_record,
  $preload_app              = $puma::params::preload_app,
  $app_root_spf             = $puma::params::app_root_spf,
  $puma_pid_path_spf        = $puma::params::puma_pid_path_spf,
  $puma_socket_path_spf     = $puma::params::puma_socket_path_spf,
  $puma_config_path_spf     = $puma::params::puma_config_path_spf,
  $puma_stdout_log_path_spf = $puma::params::puma_stdout_log_path_spf,
  $puma_stderr_log_path_spf = $puma::params::puma_stderr_log_path_spf,
  $init_script_spf          = $puma::params::init_script_spf,
  $rails_env                = $puma::params::rails_env,
  $rvm_ruby                 = $puma::params::rvm_ruby,
  $service_type             = $puma::params::service_type,
  $restart_command          = $puma::params::restart_command
  $service_ensure           = $puma::params::service_ensure
  $service_enable           = $puma::params::service_enable
  $worker_boot_timeout      = $puma::params::worker_boot_timeout
) inherits puma::params{
}
