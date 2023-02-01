class io_homes (
  $ensure                    = lookup('ensure', undef, undef, 'present'),
  $psft_runtime_user_name    = lookup('psft_runtime_user_name', undef, undef, 'psadm2'),
  $psft_install_user_name    = lookup('psft_install_user_name', undef, undef, 'psadm1'),
  $oracle_install_group_name = lookup('oracle_install_group_name', undef, undef, 'oinstall'),
  $ps_home_location          = lookup('ps_home_location', undef, undef, ''),
  $ps_cust_home_location     = lookup('ps_cust_home_location', undef, undef, ''),
  $unicode                   = lookup('unicode', undef, undef, undef),
  $ps_home_files             = undef,
  $ps_cust_home_files        = undef,
) {

  if ($ps_home_files) {
    contain ::io_homes::ps_home
  }
  if ($ps_cust_home_files) {
    contain ::io_homes::ps_cust_home
  }


}
