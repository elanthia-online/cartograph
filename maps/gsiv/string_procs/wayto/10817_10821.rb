if resolve = Spell[9704] and resolve.known? and resolve.affordable? and not resolve.active?
 resolve.cast
 end
 empty_hands
 move 'go water'
 waitrt?