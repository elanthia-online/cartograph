UserVars.mapdb_fwi_return_room = Room.current.id
worn = !GameObj[UserVars.mapdb_fwi_trinket].nil?
unless worn
  fput 'get my ' + UserVars.mapdb_fwi_trinket
  ttl = Time.now + 5
  wait_while do Time.now < ttl and GameObj[UserVars.mapdb_fwi_trinket].nil? end
  fail "could not find your teleporter" if GameObj[UserVars.mapdb_fwi_trinket].nil?
end
fput 'turn #' + GameObj[UserVars.mapdb_fwi_trinket].id
unless worn then fput 'stow my ' + UserVars.mapdb_fwi_trinket end
pause 0.5
$go2_restart=true