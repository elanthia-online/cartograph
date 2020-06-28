if Skills.climbing >= [percentencumbrance/1.25,12].max
 120.0
 elsif [407, 1604, 304, 1207].any? { |num| Spell[num].known? }
 0.6
 elsif (Char.prof == 'Warrior') and (Stats.level >= 15)
 5.2
 else 120.0
 end