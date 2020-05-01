set la  [list 1 2 3]
set la_len  [llength  la]
puts "la(1)= [lindex $la 1]"
lset la 1 9   
puts "modify la(1)= [lindex $la 1]"
lappend la  4 5 6  
puts "modify la(1)= [lindex $la 1]"