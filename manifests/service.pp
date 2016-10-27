class aprsdigi::service inherits aprsdigi {
  service { 'aprsdigi':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
