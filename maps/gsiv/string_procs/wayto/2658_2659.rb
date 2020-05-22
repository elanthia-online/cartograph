clear
put 'look'
loop {
line = get
if line =~ /a flight of (ascending|descending) steps (curving along|leading straight through) the (northern|eastern|southern|western) wall, a flight of (ascending|descending) steps (curving along|leading straight through) the (northern|eastern|southern|western) wall, a flight of (ascending|descending) steps (curving along|leading straight through) the (northern|eastern|southern|western) wall and a flight of (ascending|descending) steps (curving along|leading straight through) the (northern|eastern|southern|western) wall\./
if $3 == 'eastern'
move 'climb steps'
elsif $6 == 'eastern'
move 'climb second steps'
elsif $9 == 'eastern'
move 'climb third steps'
elsif $12 == 'eastern'
move 'climb fourth steps'
else
echo "error: unique_map_movements can't find the right steps"
exit
end
break
end
}