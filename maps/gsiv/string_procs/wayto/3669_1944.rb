UserVars.mapdb_fwi_return_room = nil
worn = false
 if GameObj[UserVars.mapdb_fwi_trinket] then worn=true end
 unless worn then fput 'get my ' + UserVars.mapdb_fwi_trinket
 end
 fput 'turn #' + GameObj[UserVars.mapdb_fwi_trinket].id
 unless worn then fput 'stow my ' + UserVars.mapdb_fwi_trinket
 end