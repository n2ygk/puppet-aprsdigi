class aprsdigi::config inherits aprsdigi {
  file { '/etc/ax25':
    ensure  => directory,
  }
  file { '/etc/ax25/aprsdigi.conf':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('aprsdigi/aprsdigi.conf.erb'),
  }
}
