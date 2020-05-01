package provide application_api 1.0
namespace eval   application_api {

namespace export *


proc show_pwd {} {

    puts "INFO:current directory: [pwd]"; 
	
  }  
puts "++++++++++++++++++++++++++++++++++++++++++++ "	
puts "you enter into the namespace: application_api "	
show_pwd ;	
puts "++++++++++++++++++++++++++++++++++++++++++++ "	



} ;# END OF application_api NAMESPACE