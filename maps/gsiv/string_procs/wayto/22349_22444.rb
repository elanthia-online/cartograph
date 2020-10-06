put "search"
while line=get
if line=~ /(dead rat|strand of silver hair|broken lockpick|tarnished coin)!$/
put "search"
elsif line=~/brick-covered trapdoor!$/
put "go trapdoor"
break
end
end