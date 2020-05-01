set roxpb        "\.rodata\.XM\..*\.XPB$"
set roxpa        "\.rodata\.XM\..*\.XPA$"


set strA1 ".rodata.XM.1.XPA"
set strA4 ".rodata.XM.4.XPA"
set strA8 ".rodata.XM.8.XPA"
set strA16 ".rodata.XM.16.XPA"


if [regexp $roxpa $strA8 roxpa_match]  {
    puts "using  $roxpa  the match is: $roxpa_match"
}


set strB1 ".rodata.XM.1.XPB"
set strB4 ".rodata.XM.4.XPB"
set strB8 ".rodata.XM.8.XPB"
set strB16 ".rodata.XM.16.XPB"

if [regexp $roxpb $strB8 roxpb_match]  {
    puts "using  $roxpb  the match is: $roxpb_match"
}


