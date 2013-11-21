class graphite::service {
  service { 'carbon':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    provider   => $graphite::params::service_provider,
  }
}
