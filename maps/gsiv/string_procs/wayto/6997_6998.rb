bridgedown = false
 until bridgedown
 if ['Halfling','Dwarf','Burghal Gnome','Forest Gnome'].include?(Char.race)
 fput 'jump'
 else
 fput 'pull rope'
 end
 bridgedown = matchtimeout(0.25, /give it a good yank!|since it is underneath|what were you referring to?|that was fun./i)
 unless standing?
 fput 'stand'
 waitrt?
 end
 waitrt?
 end
 move 'go drawbridge'
 $go2_restart = true if Room.current.id != 6998