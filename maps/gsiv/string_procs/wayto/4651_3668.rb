UserVars.mapdb_fwi_return_room = Room.current.id
worn = false
 if GameObj[UserVars.mapdb_fwi_trinket] then worn=true end
 unless worn then fput 'get my ' + UserVars.mapdb_fwi_trinket
 end
 fput 'turn #' + GameObj[UserVars.mapdb_fwi_trinket].id
 unless worn then fput 'stow my ' + UserVars.mapdb_fwi_trinket
 end
pause 0.5
$go2_restart=true