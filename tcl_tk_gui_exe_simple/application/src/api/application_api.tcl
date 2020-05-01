package provide application_api 1.0

version_number=1.2.3.4

##############################application API################################

namespace eval application_api {

  if {[llength [info var application_gui::view]] == 0} {
    if {[info exists ::CONFIG_GUI_VIEW_DEFAULT_VIEW]} {
      set application_gui::view $::CONFIG_DEFAULT_VIEW
    } else {
      set application_gui::view "customer"
    }
  }
  
proc show_pwd {} {

    puts [pwd]
	
  }  
  

  
  
  
  
} ;# END OF application_api NAMESPACE
