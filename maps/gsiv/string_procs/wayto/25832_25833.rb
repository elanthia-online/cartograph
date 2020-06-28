direction="southeast"
start=Room.current.id
 dothistimeout "pedal #{direction}", 2, /pedal/ while Room.current.id == start