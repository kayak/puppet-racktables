# Installs apache and racktables vhost
class racktables::apache (
  $vhost            = $::racktables::vhost,
  $ssl_cert         = $::racktables::ssl_cert,
  $ssl_key          = $::racktables::ssl_key,
  $datadir          = $::racktables::datadir,
  $custom_fragment  = $::racktables::custom_fragment
) {

  validate_string($vhost)
  validate_string($ssl_cert)
  validate_string($ssl_key)
  validate_string($datadir)

  class { '::apache':
    default_mods        => false,
    default_confd_files => false,
    default_vhost       => false,
    default_ssl_vhost   => false,
    mpm_module          => 'prefork',
  }

  class {'::apache::mod::php': }
  class {'::apache::mod::auth_basic': }
  class {'::apache::mod::authnz_ldap': }

  apache::vhost { "${vhost}-http":
    servername      => $vhost,
    port            => '80',
    docroot         => "${datadir}/wwwroot",
    access_log_file => "${vhost}_access_log",
    error_log_file  => "${vhost}_error_log",
    redirect_source => ['/'],
    redirect_dest   => ["https://${vhost}/"],
    redirect_status => ['temp'],
    require         => Vcsrepo[$datadir],
  }

  apache::vhost { "${vhost}-https":
    servername      => $vhost,
    port            => '443',
    docroot         => "${datadir}/wwwroot",
    access_log_file => "${vhost}_access_ssl_log",
    error_log_file  => "${vhost}_error_ssl_log",
    ssl             => true,
    ssl_cert        => $ssl_cert,
    ssl_key         => $ssl_key,
    override        => 'AuthConfig',
    custom_fragment => $custom_fragment,
    require         => Vcsrepo[$datadir],
  }

}
