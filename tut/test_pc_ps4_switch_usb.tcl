
golem::interface set hid

set times  1000
set start [clock seconds]
for {set n 0} {$n < $times} {incr n} {
	set ver [golem::sendcmd CTRL CONTROL_APP_GET_VERSION {}]
	set mode 
    #puts $ver
}
set diff [expr [clock seconds]-$start]
puts "$diff seconds"