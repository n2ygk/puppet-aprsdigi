class aprsdigi::params {
  $callsign = undef,
  $intf = "sm0",
  $aliases = "RELAY,TRACE,WIDE1-1,TRACE1-1",
  $lat = undef, #example: "4118.  N" (blanks for location ambiguity)
  $lon = undef, #example: "07353.  W"
  $phg = undef, # power height gain: "PHG7300"
  $txt = undef, # "fill in digipeater www.weca.org"
  $dst = "APRS via WIDE2-2", # default for a fill-in digipeater.
  $logfile = "/var/log/aprsdigi.log",
  $kill_dupes = true,
  $kill_loops = true,
  $subst_mycall = true,
  $x1j4_xlate = true,
}
