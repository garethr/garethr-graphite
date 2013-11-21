class graphite::params {
  $admin_password = 'sha1$1b11b$edeb0a67a9622f1f2cfeabf9188a711f5ac7d236'
  $port = 80

  case $::operatingsystem {
    'Ubuntu': {
      $service_provider = upstart
    }
    'Debian': {
      $service_provider = debian
    }
  }
  $manage_python = true
}
