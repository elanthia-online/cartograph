10.times { fput 'stand' unless standing?
 waitrt? }
 fput 'go ladder'
 if celerity = Spell[506] and celerity.known? and celerity.affordable? and not celerity.active?
 celerity.cast
 end
 10.times { res = dothistimeout 'search', 3, /own leg|You take small comfort|find nothing|low opening/
 break if res !~ /low opening/}
 move 'go opening'