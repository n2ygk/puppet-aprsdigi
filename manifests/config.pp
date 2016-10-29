class aprsdigi::config inherits aprsdigi {
  file { '/etc/ax25':
    ensure  => directory,
  }
  # build up the aprsdigi options to look something like this:
  # --kill_dupes --kill_loops --logfile /var/log/aprsdigi.log --trace WIDE --trace TRACE --subst_mycall --x1j4_xlate --interface ax25:sm0:RELAY,WIDE,TRACE

  $opts = ""
  if $kill_dupes {
    $opts = "${opts} --kill_dupes"
  }
  if $kill_loops {
    $opts = "${opts} --kill_loops"
  }
  if $subst_mycall {
    $opts = "${opts} --subst_mycall"
  }
  if $x1j4_xlate {
    $opts = "${opts} --x1j4_xlate"
  }
  if $logfile {
    $opts = "${opts} --logfile ${logfile}"
  }
  if $traces {
    $traces.each |$i| { $opts = "${opts} --trace ${i}" }
  }  
  $int = "--interface ax25:${intf}"
  $aliases.each |$i| { $int = "${int}:${i}" }
  $aprsdigi_opts = "${opts} ${int}"  
  $beacon_text = "!${lat}/${lon}#PHG${phg}/${txt}"
  file { '/etc/ax25/aprsdigi.conf':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('aprsdigi/aprsdigi.conf.erb'),
  }
}
