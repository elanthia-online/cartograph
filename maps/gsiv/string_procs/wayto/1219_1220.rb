begin
 fput 'search'
 search_result = waitfor "don't find anything", "discover a northwest path", "Roundtime", "Round time"
 waitrt?
 end until search_result =~ /discover a northwest path/
 move 'go path'