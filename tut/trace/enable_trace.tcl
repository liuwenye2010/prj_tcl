set ::TraceFd   [open {./trace_log.txt} a ]
proc ::TraceLog  args {
   puts $::TraceFd  $args
}
trace add execution source    {enterstep leavestep} ::TraceLog 
source ./test.tcl 