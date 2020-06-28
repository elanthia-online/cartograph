2.times { fput 'touch teeth'
 sleep 1
 wait_while { stunned? } }
 fput 'touch left wing'
 fput 'touch right wing'
 wait_until { Room.current.id == 12415 }