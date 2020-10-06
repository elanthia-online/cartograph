if GameObj.loot.find{|item| item.noun == "door"}
fput "go door"
else
fput "push stone"
fput "stand" until standing?
fput "go door"
end