#demo how to use the tcl c extension 

set dir [pwd]

load $dir/pkg/lib/Debug/tcl_c_lib.dll 
puts "load $dir/lib/Debug/tcl_c_lib.dll "
puts "package random [package require random]"

puts "demo the c exension lib with function random"
for {set x 0} {$x<10} {incr x} {
   set  y  [random  10] 
   puts "index is $x, random 10 ==> $y" 
   
}



