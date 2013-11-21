class graphite::install {

  if $graphite::manage_python {
    include python
  } else {
    ensure_packages(['python-pip'])
  }

  ensure_packages([
    'python-ldap',
    'python-cairo',
    'python-django',
    'python-twisted',
    'python-django-tagging',
    'python-simplejson',
    'libapache2-mod-python',
    'python-memcache',
    'python-pysqlite2',
    'python-support',
  ])

  Package['python-pip'] -> Package <| provider == 'pip' and ensure != absent and ensure != purged |>

  package { ['whisper', 'carbon', 'graphite-web']:
    ensure   => installed,
    provider => pip,
    require  => Class['python'],
  }

  file { '/var/log/carbon':
    ensure => directory,
    owner  => www-data,
    group  => www-data,
  }

  file {'/var/lib/graphite':
    ensure => directory,
    owner  => www-data,
    group  => www-data,
  }

  file {'/var/lib/graphite/db.sqlite3':
    ensure => present,
    owner  => www-data,
    group  => www-data,
  }

}
