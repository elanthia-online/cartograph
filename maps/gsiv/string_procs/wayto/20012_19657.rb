put "open door"
while line = get
if line =~ /You open a large stone door\./
fput "go door"
break
elsif line =~ /It appears to be locked\./
fput "turn lock"
put "open door"
elsif line =~ /That is already open\./
fput "go door"
break
end
end