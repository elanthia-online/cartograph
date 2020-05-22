empty_hands
old_stance = checkstance
fput 'stance offensive' unless old_stance == 'offensive'
until !checkpaths
fput 'stand' unless standing?
fput 'climb ledge'
sleep 0.1
waitrt?
end
fput 'stance ' + old_stance unless old_stance == 'offensive'