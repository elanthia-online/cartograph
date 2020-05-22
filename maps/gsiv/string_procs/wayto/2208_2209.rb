empty_hands
begin
fput "climb fissure"
waitingfor = "Round time", "Roundtime", "find yourself", "Crawlway"
waitrt?
end until waitingfor !~ /round/i
fill_hands