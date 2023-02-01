# io_homes::ps_home
#
# Deploy custom files to PS_HOME
#
# @summary This class will take the list of pages defined in Hiera
#   and deploy them to PS_HOME.
#
# @example
#   include io_homes::ps_home
class io_homes::ps_home (
  $ensure                     = $io_homes::ensure,
  $source                     = $io_homes::source,
  $files                      = $io_homes::ps_home_files,
  $ps_home_location           = $io_homes::ps_home_location,
  $psft_install_user_name     = $io_homes::psft_install_user_name,
  $oracle_install_group_name  = $io_homes::oracle_install_group_name,
  $unicode                    = $io_homes::unicode,
) inherits io_homes {

  # #####################
  # PS_HOME/fonts/trueype
  # #####################
  if ($files['fonts']) {
    notify { 'Deplying Custom Files - Fonts': }

    $files['fonts'].each | $file | {

      file {"${ps_home_location}/font/truetype/${file}":
        ensure => $ensure,
        source => "${source}/${file}",
        owner  => $psft_install_user_name,
        group  => $oracle_install_group_name,
        mode   => '0644',
      }
    }
  } else {
    notify { 'No custom fonts to deploy': }
  }

  # ###########
  # Unicode.cfg
  # ###########
  if ($files['unicode'] == False) {
    notify { 'Removing unicode.cfg': }
    file {"${ps_home_location}/setup/unicode.cfg":
      ensure => absent,
    }
  }

  # ###########
  # PS_HOME/bin
  # ###########
  if ($files['bin']) {
    notify { 'Deplying Custom Files - Binaries': }

    $files['bin'].each | $file | {

      file {"${ps_home_location}/bin/${file}":
        ensure => $ensure,
        source => "${source}/${file}",
        owner  => $psft_install_user_name,
        group  => $oracle_install_group_name,
        mode   => '0644',
      }
    }
  } else {
    notify { 'No custom binaries to deploy': }
  }

  # ###############
  # PS_HOME/appserv
  # ###############
  if ($files['appserv']) {
    notify { 'Deplying Custom Files - Appserv': }

    $files['appserv'].each | $file | {

      file {"${ps_home_location}/appserv/${file}":
        ensure => $ensure,
        source => "${source}/${file}",
        owner  => $psft_install_user_name,
        group  => $oracle_install_group_name,
        mode   => '0644',
      }
    }
  } else {
    notify { 'No custom appserv files to deploy': }
  }

}
