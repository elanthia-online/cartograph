if celerity = Spell[506] and celerity.known? and celerity.affordable? and not celerity.active?
 celerity.cast
 end
 fput 'search'
 move 'go hole'