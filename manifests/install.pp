class graphite::install {

  include python

  package {[
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
  ]:
    ensure => latest;
  }

  exec { 'install-carbon':
    command => 'pip install carbon',
    creates => '/opt/graphite/lib/carbon',
    requires => Class['python'],
  }

  exec { 'install-graphite-web':
    command => 'pip install graphite-web',
    creates => '/opt/graphite/webapp/graphite',
    requires => Class['python'],
  }

  package { 'whisper':
    ensure   => installed,
    provider => pip,
    requires => Class['python'],
  }

  file { '/var/log/carbon':
    ensure => directory,
    owner  => www-data,
    group  => www-data,
  }

}
