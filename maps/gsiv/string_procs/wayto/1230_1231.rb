begin
 fput 'search'
 search_result = waitfor "don't find anything", "discover an? obscured crack", "Roundtime", "Round time"
 waitrt?
 end until search_result =~ /discover an? obscured crack/
 move 'go crack'