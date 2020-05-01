proc greeting {name} {
    puts "Hello, $name"
}
  
proc showWeekDay {} {
    set now [clock seconds]
    puts [clock format $now -format "Today is %A"]
}

greeting 