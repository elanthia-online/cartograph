put "open door"
while line = get
if line=~ /You open the nearly invisible stone door\.|That is already open\./
fput "go door"
break
elsif line =~ /It appears to be locked\./
Room["19657"].timeto["20012"]=15000
force_start_script("go2", ["20012"])
pause 2
Room["19657"].timeto["20012"]=0.2
break
end
end