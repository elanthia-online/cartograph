UserVars.DUSKRUIN_ENTRANCE=1870
echo "Waiting for wagon..."
rc=XMLData.room_count
wait_until{!checkloot.nil? && checkloot.include?("wagon")}
fput "go wagon"
wait_until{XMLData.room_count >= rc+2}