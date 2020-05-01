set SCRDIR "scripts"
set scrpts [lsort [glob $SCRDIR/*.tcl]]
puts "scripts: $scrpts"
set TCLTOOL "tclkitsh-8.5.9-win32.upx.exe"

set  _DEBUG  1 
if { $_DEBUG > 0 }  {
	set prefix  "Application"
}


#-------------------------------------------------------------------------------
#                             Local Functions
#-------------------------------------------------------------------------------
proc script_id {binfname} {
  global prefix SCRDIR;
  puts "SCRDIR: $SCRDIR"
  puts "binfile name: $binfname"
  set scr_id  ""
  set tmp1 [regsub ^$SCRDIR\/($prefix)_(....)_.*\.tcl $binfname {\2} scr_id]
  puts "scr_id: $scr_id "	
  if {$tmp1 == 1} {
    return $scr_id;
  } else {
	 puts "can't find the scripts";
        return -1;
    }
}


proc getopt {_argv name {_var ""} {default ""}} {
    upvar 1 $_argv argv $_var var

    set var ""

    set pos [lsearch -regexp $argv ^$name]
    if {$pos>=0} {
      set to $pos
      if {$_var ne ""} {
          set var [lindex $argv [incr to]]
      }
      set argv [lreplace $argv $pos $to]
      return 1
    } else {
      if {[llength [info level 0]] == 5} {set var $default}
      return 0
    }
}


proc look_for_scr_file {script_to_find} {
  global SCRDIR scrpts;
  set found_scr ""

  foreach script $scrpts {
    set scr_id [script_id $script]
    if [string match $scr_id $script_to_find] {
      set found_scr $script
    }
  }
  return $found_scr
}

proc run_scripts_file {scr_file_name} {
    global application_namespace 

    source $scr_file_name


}

#-------------------------------------------------------------------------------

set help [getopt argv -h]
if {$help} {
  puts "\nUsage:"
  puts "====="
  puts "run_tclsh.bat -d <mode> \[options\]\n"
  puts "  -d <MODE>                 : Mode to run"
  puts "                              NOTE: This is required argument"
  puts "Options:"
  puts "-------"
  puts "  -h                        : Help"
  puts "  -ns <namespace>           : Namespace of simulated mode-script"
  puts "                              Default =application_api"
  puts "  -pi <input_file_path>     : Path to the Input File"
  puts "                              Default =input"
  puts "  -i <input_file_name>      : Input File Name"
  puts "                              Default = input.txt"
  puts "  -po <output_file_path>    : Path to the Output File"
  puts "                              Default = output"
  puts "  -o <output_file_name>     : Input Output File Name"
  puts "                              Default = output.txt"
  return
}

getopt argv -d  application_mode "TEST"
getopt argv -ns application_namespace "application_api"
getopt argv -pi input_file_path "input"
getopt argv -po output_file_path "output"
getopt argv -i input_file_name "input.txt"
getopt argv -o output_file_name "output.txt"

puts "application_namespace : $application_namespace"
namespace eval $application_namespace {
  namespace export *
}

puts ""

#set scr_file_name [look_for_scr_file $application_mode]
set  scr_file_name $scrpts
if {$scr_file_name == ""} {
        error "ERROR: The required mode file was not found"
}

# Load DLL  
# if {$::tcl_platform(os) != "Linux"} {
  # if { [catch {set sim [glob *.dll]}] != 0 } {error "ERROR: DLL File not Found\n"};
# }
# if {$::tcl_platform(os) == "Linux"} {
  # if { [catch {set sim [glob *.so]}] != 0 }  {error "ERROR: DLL File not Found\n"};
# }




# set input and output files
variable ${application_namespace}::input_path           $input_file_path
variable ${application_namespace}::input_file           $input_file_name
variable ${application_namespace}::output_path          $output_file_path
variable ${application_namespace}::output_file          $output_file_name


# run app 

puts "Script file: $scr_file_name"

if {$application_namespace == "application_api"} {
  source $scr_file_name 
} else {
  if [string match "T*" $application_mode] {
    run_scripts_file $scr_file_name  
  } else {
    source $scr_file_name  
  }
}







