package provide application_gui 1.0


package require Tk
package require Ttk

set CONFIG_KOMODO_DEBUG  0 

set mydir [file dirname [dict get [info frame 0] file]]

puts "mydir is $mydir"


if {$CONFIG_KOMODO_DEBUG} {
	
#please use the abs path  to sure the 
#source "[file dirname [dict get [info frame 0] file]]/../config.tcl"
	
} else {
source "[file dirname [dict get [info frame 0] file]]/config.tcl"
}




namespace eval application_gui {

  namespace export *

  variable version_number "1.2.0.0"
  variable build_number

  set build_number "1.2.3.4"

}


#-------------------------------------------------------------------------------
# Initialize the appliaiton
#-------------------------------------------------------------------------------
set mydir [file dirname [dict get [info frame 0] file]]

puts "mydir is $mydir"

if {$CONFIG_KOMODO_DEBUG} {
#source "[file dirname [dict get [info frame 0] file]]/gui/application_gui.tcl"
#please use the abs path 
} else {
	
source "[file dirname [dict get [info frame 0] file]]/application_gui.tcl"	
}

application_gui::create_gui



#applcation::application_initialize_api
# Load startup script, if present
  set startup [glob -nocomplain -directory . application_startup.tcl]
  if {[llength $startup] == 1} {
    if {[catch {source $startup}]} {
      tk_messageBox -message "There is an error in your $startup file"\
	  -type ok -icon info

    }
  }
