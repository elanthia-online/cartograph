fput 'jump'
waitfor 'You feel the presence of cold hard stone underneath you.'
sleep 0.1
fput 'stand' unless standing?
move 'west' until Room.current.id == 12593