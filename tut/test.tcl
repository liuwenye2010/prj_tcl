#
# Report all the files and subdirectories in the current directory
# For files: show the size
# For directories: show that they _are_ directories
#

set dirs [glob -nocomplain -type d *]
if { [llength $dirs] > 0 } {
    puts "Directories:"
    foreach d [lsort $dirs] {
        puts "    $d"
    }
} else {
    puts "(no subdirectories)"
}

set files [glob -nocomplain -type f *]
if { [llength $files] > 0 } {
    puts "Files:"
    foreach f [lsort $files] {
        puts "    [file size $f] - $f"
    }
} else {
    puts "(no files)"
}
