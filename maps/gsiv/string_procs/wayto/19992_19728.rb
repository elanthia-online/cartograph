put "open door"
while line = get
if line =~ /Okay, it opens\./
fput "go door"
break
elsif line =~ /It's locked/
fput "turn lock"
put "open door"
end
end