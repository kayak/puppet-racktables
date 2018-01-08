# Installs RackTables
class racktables::install (
                           $release            = $::racktables::release,
                           $datadir            = $::racktables::datadir,
                           $packages           = $::racktables::packages,
                           $repoensure         = $::racktables::repoensure,
                           $vcsprovider        = $::racktables::vcsprovider,
                           $source             = $::racktables::source,
                           $installvcsprovider = $::racktables::installvcsprovider,
                           ) {

  validate_string($release)
  validate_string($datadir)
  validate_array($packages)
  validate_re($repoensure, '^(present|latest)$',
              "${repoensure} is not supported for repoensure.
              Allowed values are 'present' and 'latest'.")
  validate_string($vcsprovider)
  validate_string($source)

  package { $packages :
    ensure => present,
  }

  if $installvcsprovider == true {
    package { $vcsprovider :
      ensure => present,
    }
  }

  # Pull RackTables from source
  if $release == undef {
    vcsrepo { $datadir:
      ensure   => $repoensure,
      provider => $vcsprovider,
      source   => $source,
      require  => Package[$vcsprovider],
    }
  }
  else {
    vcsrepo { $datadir :
      ensure   => $repoensure,
      provider => $vcsprovider,
      source   => $source,
      revision => $release,
      require  => Package[$vcsprovider],
    }
  }

}
