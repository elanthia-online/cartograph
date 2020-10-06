status_tags
 get_result = dothis 'get my lockpick', /You remove .*?<a exist="(?:[0-9]+)".*?from.*?<a exist="(?:[0-9]+)"/
 status_tags
 lockpick, container = /You remove .*?<a exist="([0-9]+)".*?from.*?<a exist="([0-9]+)"/.match(get_result).captures[0..1]
 fput 'pick shed'
 fput "_drag ##{lockpick} ##{container}"
 fput 'open shed'
 move 'go shed'