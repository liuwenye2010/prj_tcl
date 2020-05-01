package provide application_gui 1.0

namespace eval application_gui {

  namespace export *
  variable value_sdg_mode CONF
   
proc about {} {
    variable version_number
    tk_messageBox -message \
	"Application_demo\n\nVersion $version_number\n\n(c)LWY Inc. 2014-2017. All rights reserved.\n\n" -type ok -icon info
  }     
   
proc create_gui {} {
    wm geometry . 469x650+0+0
    wm geometry . ""
    wm resizable . 1 1

    menu .menubar 
    . configure -menu .menubar 
    .menubar add cascade -label File -menu .menubar.file -underline 0 
    .menubar add cascade -label View -menu .menubar.view -underline 0 
    .menubar add cascade -label Help -menu .menubar.help -underline 0 

 

    menu .menubar.file -tearoff 0
    .menubar.file add cascade -label "Connect Using" -menu .menubar.file.connect \
      -underline 0


    menu .menubar.file.connect -tearoff 0

    if {[info exists ::CONFIG_TCP]} {
      .menubar.file.connect add command -label "TCP/IP" \
        -command [list application_gui::about]
    }
    if {[info exists ::CONFIG_USB]} {
      .menubar.file.connect add command -label "USB-HID" \
        -command [list application_gui::about]
    }
}


    #menu .menubar.view -tearoff 0
}   ;# END OF application_gui NAMESPACE
