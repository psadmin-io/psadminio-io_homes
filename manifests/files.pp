# io_ps_home::files
#
# Deploy custom files to PS_HOME
#
# @summary This class will take the list of pages defined in Hiera
#   and deploy them to PS_HOME.
#
# @example
#   include io_ps_home::files
class io_ps_home::files (
  $ensure                  = $io_ps_home::ensure,
  $source                  = $io_ps_home::source,
  $files                   = $io_ps_home::files,
  $psft_runtime_user_name  = $io_ps_home::psft_runtime_user_name,
  $psft_runtime_group_name = $io_ps_home::psft_runtime_group_name,
) inherits io_ps_home {
  if ($files['root']) {
      notify { "Deplying Custom Signon Pages - ${domain_name} Root": }

      $files['root'].each | $file | {

        file {"${portalwar}/${file}":
          ensure => $ensure,
          source => "${source}/${file}",
          owner  => $psft_runtime_user_name,
          group  => $psft_runtime_group_name,
          mode   => '0644',
        }
      }
    }
  } else {
    notify { "${domain_name} No root custom files to deploy": }
  } # end of 'root'

}
