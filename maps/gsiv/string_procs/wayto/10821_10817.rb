loop { fput 'swim'
 sleep 1
 waitrt?
 break if checkpaths.include?('w') or checkpaths.include?('e')
 }
 fill_hands