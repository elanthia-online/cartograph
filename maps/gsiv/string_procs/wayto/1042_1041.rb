move 'climb boulder'
fput 'look trail'
dir = matchfindword "You peer into the mist and see that the trail heads off to the ?"
move 'down'
sleep 5 if running?('agoto')
move dir