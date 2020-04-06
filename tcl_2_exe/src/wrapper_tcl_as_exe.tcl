
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

set help [getopt argv -h]
if {$help} {
  puts "wrapper_tcl_as_exe.exe is a example to convert tcl to exe"
  puts "\nUsage:"
  puts "====="
  puts "wrapper_tcl_as_exe.exe <options>\n"
  puts "Options:"
  puts "-------"
  puts "  -h                        : Help" 
  return
}

#set str           [getopt argv -serial       seri_str       "00000000"]




