if dothistimeout('go stone doors', 3, /^Obvious exits: west$|^You cannot/) !~ /^Obvious/
 s = Spell[920]
 if s.known?
 if s.active?
 r = dothistimeout 'tell familiar to return', 15, /^You sense understanding from your .+/
 if f = /You sense understanding from your (.+)\./.match(r).captures.first
 150.times { sleep 0.1
 break if GameObj.npcs.any? { |n| n.name =~ /#{f}/ } }
 end
 else
 unless s.affordable?
 echo 'Waiting for mana...'
 wait_until { s.affordable? }
 end
 s.cast
 end
 r = dothistimeout 'tell familiar to watch', 15, /^You sense understanding|is already watching/
 stop_watching = (r =~ /^You sense understanding/)
 which_ring = { 'iron' => 'iron', 'steel' => 'steel', 'bronze' => 'copper', 'copper' => 'bronze' }
 fail = false
 g = proc { |l| l.split(',').each { |d| r = dothistimeout(('tell familiar to go ' + d), 15, /^You sense|just squeezed between the stone doors|^Obvious (?:exits|paths)/)
 if r.nil? or (r =~ /^You sense confusion/)
 fail = true
 next
 elsif r =~ /^You sense that your .* is not able to enter the (.+) door/
 dothistimeout(('tell familiar to get ' + which_ring[$1] + ' ring'), 15, /^Your familiar reacts with mild confusion|^You sense/)
 dothistimeout(('tell familiar to go ' + d), 15, /^You sense|^Obvious (?:exits|paths)/)
 end } }
 4.times { |i| i.zero? ? g.call('doors,w,s,arch,ne,e,privy,hole,w') : g.call('nw,w,w,n,')
 break if fail
 g.call('w,w,sw,iron door,steel door,bronze door,copper door')
 break if fail
 fput 'tell familiar to get rocks'
 g.call('copper door,bronze door,steel door,iron door,ne,e,e,s,e,e,se')
 break if fail
 fput 'tell familiar to drop basket' }
 fput 'tell familiar to stop watching' if stop_watching
 if UserVars.mapdb_hate_familiar
 sleep 0.3
 put 'tell familiar to return'
 put 'tell familiar to stay'
 end
 end
 move 'go doors'
 end