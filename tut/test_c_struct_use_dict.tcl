#
# Create a dictionary:
# Two clients, known by their client number,
# with forenames, surname
#
dict set clients 1 forenames Joe
dict set clients 1 surname   Schmoe
dict set clients 2 forenames Anne
dict set clients 2 surname   Other

#
# Print a table
#
puts "Number of clients: [dict size $clients]"
dict for {id info} $clients {
    puts "Client $id:"
    dict with info {
       puts "   Name: $forenames $surname"
    }
}

proc find_match_idx {a,b} {
foreach content $b {
    set idx [lsearch $a $content]
    if {$idx >= 0} {
	set matching_value [lindex $a $idx]
	puts "found match $matching_value"
	break
    }
}
}


# ModuleReturnCode
set MODULE_RC_FIRST -1024
#-------------------------------------------------------------------------------
set MODULE_RC_SUCCESS                0

set MODULE_RC_GENERIC_FAILURE        [expr {$MODULE_RC_FIRST- 1}]; # -1025
set MODULE_RC_ALREADY_EXISTS         [expr {$MODULE_RC_FIRST- 2}]; # -1026
set MODULE_RC_NULL_APP_POINTER       [expr {$MODULE_RC_FIRST- 3}]; # -1027
set MODULE_RC_NULL_MODULE_POINTER    [expr {$MODULE_RC_FIRST- 4}]; # -1028
set MODULE_RC_NULL_STREAM_POINTER    [expr {$MODULE_RC_FIRST- 5}]; # -1029
set MODULE_RC_NULL_POINTER           [expr {$MODULE_RC_FIRST- 6}]; # -1030


set err_num $::MODULE_RC_GENERIC_FAILURE
parse_commands_err_code  $err_num

proc  parse_commands_err_code { err_code } {
    puts "err_code == $err_code" 
    switch  $err_code {
	[$::MODULE_RC_GENERIC_FAILURE]  {
	 puts "MODULE_RC_GENERIC_FAILURE"
      }
      c {
	  expr {2}
      }
	
      -1026   {
	    puts "hit -1025"
	}
      default {
	  expr {3}
      }
     }
    
   }
