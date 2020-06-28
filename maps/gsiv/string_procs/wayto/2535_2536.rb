if (UserVars.mapdb_ice_mode == 'wait') or ((UserVars.mapdb_ice_mode != 'run') and ((percentencumbrance > 50) or ((Skills.survival < 50) and not Spell['Haste'].active?)))
 sleep 0.2
 echo 'trying not to slip...'
 sleep 4
 end
 move 'west'