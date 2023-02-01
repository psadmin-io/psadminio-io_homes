# io_homes::ps_cust_home
#
# Deploy custom files to PS_CUST_HOME
#
# @summary This class will take the list of pages defined in Hiera
#   and deploy them to PS_CUST_HOME.
#
# @example
#   include io_homes::ps_cust_home
class io_homes::ps_cust_home (
  $ensure                     = $io_homes::ensure,
  $source                     = $io_homes::source,
  $files                      = $io_homes::ps_cust_home_files,
  $ps_cust_home_location      = $io_homes::ps_cust_home_location,
  $psft_runtime_user_name     = $io_homes::psft_runtime_user_name,
  $psft_runtime_group_name    = $io_homes::psft_runtime_group_name,
) inherits io_homes {

  # ##########################
  # PS_CUST_HOME/fonts/trueype
  # ##########################
  if ($files['fonts']) {
    notify { 'Deplying Custom PS_CUST_HOME Files - Fonts': }

    $files['fonts'].each | $file | {

      file {"${ps_cust_home_location}/fonts/truetype/${file}":
        ensure => $ensure,
        source => "${source}/${file}",
        owner  => $psft_runtime_user_name,
        group  => $psft_runtime_group_name,
        mode   => '0644',
      }
    }
  } else {
    notify { 'No custom PS_CUST_HOME fonts to deploy': }
  }

  # ################
  # PS_CUST_HOME/bin
  # ################
  if ($files['bin']) {
    notify { 'Deplying Custom PS_CUST_HOME Files - Binaries': }

    $files['bin'].each | $file | {

      file {"${ps_cust_home_location}/bin/${file}":
        ensure => $ensure,
        source => "${source}/${file}",
        owner  => $psft_runtime_user_name,
        group  => $psft_runtime_group_name,
        mode   => '0644',
      }
    }
  } else {
    notify { 'No custom PS_CUST_HOME binaries to deploy': }
  }

  # ##################
  # PS_CUST_HOME/class
  # ##################
  if ($files['class']) {
    notify { 'Deplying Custom PS_CUST_HOME Files - Class': }

    $files['class'].each | $file | {

      file {"${ps_cust_home_location}/class/${file}":
        ensure => $ensure,
        source => "${source}/${file}",
        owner  => $psft_runtime_user_name,
        group  => $psft_runtime_group_name,
        mode   => '0644',
      }
    }
  } else {
    notify { 'No custom PS_CUST_HOME class files to deploy': }
  }

  # ####################
  # PS_CUST_HOME/appserv
  # ####################
  if ($files['appserv']) {
    notify { 'Deplying Custom PS_CUST_HOME Files - Appserv': }

    $files['appserv'].each | $file | {

      file {"${ps_cust_home_location}/appserv/${file}":
        ensure => $ensure,
        source => "${source}/${file}",
        owner  => $psft_runtime_user_name,
        group  => $psft_runtime_group_name,
        mode   => '0644',
      }
    }
  } else {
    notify { 'No custom PS_CUST_HOME appserv files to deploy': }
  }

}
