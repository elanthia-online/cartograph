if resolve = Spell[9704] and resolve.known? and resolve.affordable? and not resolve.active?
 resolve.cast
 end
 if waterwalking = Spell[112] and waterwalking.known? and waterwalking.affordable? and not waterwalking.active?
 waterwalking.cast
 end
 fput (Spell[112].active? ? 'go west' : 'swim west')