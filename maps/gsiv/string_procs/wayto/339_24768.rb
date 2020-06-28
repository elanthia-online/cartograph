query = "ivy-covered grey stone building with a sturdy cross-gabled roof"
shop = GameObj.loot.find { |i| i.name.eql?(query) }
shop or fail "could not locate: #{query}"
fput "go ##{shop.id}"