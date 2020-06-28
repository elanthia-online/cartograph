if Spell['Haste'].active?
 (15 * [((80 - ([Spells.majorelemental,Stats.level].min/5) - (Skills.elair/5)) / 100.0), 0.4].max).floor + 0.2
 else
 15.2
 end