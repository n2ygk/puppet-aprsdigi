# == Class: aprsdigi
#
# Install and configure Alan Crosswell's aprsdigi 
#
# === Parameters
#
# Document parameters here.
#
# [*callsign*]
#   Amateur radio AX.25 call sign.
#
# 
# === Examples
#
#  class { 'aprsdigi':
#    callsign                     => 'N0NE-15',
#  }
#
# === Authors
#
# Alan Crosswell <n2ygk@weca.org>
#
# === Copyright
#
# Copyright 2016 Alan Crosswell
#
class aprsdigi (
  $callsign     = $aprsdigi::params::callsign,
  $intf         = $aprsdigi::params:intf,
  $aliases	= $aprsdigi::params:aliases,
  $lat		= $aprsdigi::params:lat,
  $lon		= $aprsdigi::params:lon,
  $phg		= $aprsdigi::params:phg,
  $txt		= $aprsdigi::params:txt,
  $dst		= $aprsdigi::params:dst,
  $logfile	= $aprsdigi::params:logfile,
  $kill_dupes	= $aprsdigi::params:kill_dupes,
  $kill_loops	= $aprsdigi::params:kill_loops,
  $subst_mycall	= $aprsdigi::params:subst_mycall,
  $x1j4_xlate	= $aprsdigi::params:x1j4_xlate,
) inherits aprsdigi::params {
  validate_string($callsign)
  validate_string($intf)  
  validate_string($aliases)
  validate_string($lat)
  validate_string($lon)
  validate_string($phg)
  validate_string($txt)
  validate_string($dst)
  validate_absolute_path($logfile)
  validate_bool($kill_dupes)
  validate_bool($kill_loops)
  validate_bool($subst_mycall)
  validate_bool($x1j4_xlate)

  anchor { 'aprsdigi::begin': } ->
  class { '::aprsdigi::install': } ->
  class { '::aprsdigi::config': } ~>
  class { '::aprsdigi::service': } ->
  anchor { 'aprsdigi::end': }
  
}
