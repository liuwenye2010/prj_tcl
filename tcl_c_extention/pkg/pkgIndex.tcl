# Tcl package index file
# This file is generated by the "pkg_mkIndex" command
# and sourced either when an application starts up or
# by a "package unknown" script.  It invokes the
# "package ifneeded" command to set up package-related
# information so that packages will be loaded automatically
# in response to "package require" commands.  When this
# script is sourced, the variable $dir must contain the
# full path name of this file's directory.



set dir [pwd]
set file_list [list source [file join $dir application.tcl]]
package ifneeded tcl_c_lib 1.0 $file_list

