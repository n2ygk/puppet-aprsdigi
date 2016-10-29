# == Class: aprsdigi
#
# Install and configure Alan Crosswell, N2YGK's Linux APRS digipeater
#
# === Parameters
#
# Document parameters here.
#
# [*callsign*]
#   Amateur radio AX.25 call sign.
# 
# [*intf*]
#   Network interface name. Default 'sm0'
#   
# [*aliases*]
#   List of aliases that this digipeater responds to. Default ["TRACE","WIDE1-1","TRACE1-1"],
# 
# [*traces*]
#   List of aliases that this digipester will perform tracing for. Default ["TRACE"]
# 
# [*lat*]
#   _DDMM.SSn_
#   Latitude of the digipeater in degrees, minutes, decimal seconds, northing. 
#   Allows for increasing levels of location ambiguity by leaving blanks in the low-order digits.
#
#   Examples: ```
#     lat => "4048.  N"
#     lat => "4048.56N"
#   ```
# 
# [*lon*]
#   _DDDMM.SSn_
#   Longitude of the digipeater in degrees, minutes, decimal seconds, easting. 
#   Allows for increasing levels of location ambiguity by leaving blanks in the low-order digits.
# 
#   Examples: ```
#     lon => "07357.61W"
#   ```
#
# [*phg*]
#   _phgd_
#   Power-height-gain-directivity encoded per the [APRS specification](http://www.aprs.org/doc/APRS101.PDF)
#   Chapter 7, page 38.
# 
#   Example: `phg => "7300"`
# 
# [*txt*]
#   Beacon text. Example: `txt => "fill in digipeater www.weca.org"`
# 
# [*dst*]
#   Destination callsign and digipeater path. Default "APRS via WIDE2-2"
#
# [*logfile*]
#   Log file path. Default "/var/log/aprsdigi.log",
# 
# [*kill_dupes*]
#   Supress duplicate packets. Default true.
# 
# [*kill_loops*]
#   Supress looping packets. Default true.
# 
# [*subst_mycall*]
#   Substitute *callsign* in place of the generic digipeat alias that is consumed.
# 
# [*x1j4_xlate*]
#   Translate weird X1J4 TNC software header to standard APRS format. Default true.
#
# === Examples
#
#  class { 'aprsdigi':
#    callsign                     => 'N0NE-15',
#    intf                         => 'sm0',
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
  $intf         = $aprsdigi::params::intf,
  $aliases	= $aprsdigi::params::aliases,
  $traces	= $aprsdigi::params::traces,
  $dst          = $aprsdigi::params::dst,
  $lat		= $aprsdigi::params::lat,
  $lon		= $aprsdigi::params::lon,
  $phg		= $aprsdigi::params::phg,
  $txt		= $aprsdigi::params::txt,
  $dst		= $aprsdigi::params::dst,
  $logfile	= $aprsdigi::params::logfile,
  $kill_dupes	= $aprsdigi::params::kill_dupes,
  $kill_loops	= $aprsdigi::params::kill_loops,
  $subst_mycall	= $aprsdigi::params::subst_mycall,
  $x1j4_xlate	= $aprsdigi::params::x1j4_xlate,
) inherits aprsdigi::params {
  validate_string($callsign)
  validate_string($intf)
  validate_array($aliases)
  if $traces != undef {         # not having any traces is allowed
    validate_array($traces)
  }
  validate_string($dst)
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
