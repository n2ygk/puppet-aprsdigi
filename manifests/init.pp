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
  $callsign                     = $aprsdigi::params::callsign,
) inherits aprsdigi::params {
  validate_string($callsign)

  anchor { 'aprsdigi::begin': } ->
  class { '::aprsdigi::install': } ->
  class { '::aprsdigi::config': } ~>
  class { '::aprsdigi::service': } ->
  anchor { 'aprsdigi::end': }
  
}
