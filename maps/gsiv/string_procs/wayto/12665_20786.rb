empty_hand if [ 12662, 12677 ].include?(Room.current.id)
 swim_dir = { 12677 => 'down', 12662 => 'whirlpool', 12987 => 'south', 12663 => 'south', 12988 => 'southeast', 12664 => 'south', 12726 => 'east', 12665 => 'south', 12666 => 'south', 12667 => 'south', 12989 => 'southeast', 12991 => 'southwest', 12668 => 'northeast', 12727 => 'west', 12990 => 'east', 12669 => 'southeast', 12670 => 'north', 12728 => 'south', 12671 => 'southeast', 12672 => 'west', 12673 => 'fissure', 12674 => 'steps', 12675 => 'northwest', 12729 => 'up', 12676 => 'southwest' }
 while Room.current.id != 20786
 if swim_dir[Room.current.id]
 put "swim #{swim_dir[Room.current.id]}"
 else
 echo "Oh crap.. I'm lost.."
 put "swim #{checkpaths[rand(checkpaths.length)]}"
 end
 sleep 1
 waitrt?
 end
 fill_hand