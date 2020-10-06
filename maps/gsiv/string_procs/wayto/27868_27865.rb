door='heavy door'
key=GameObj.inv.find{|k| k.name=='cord-strung delicate brass key'
}
if !key.nil? then multifput "remove ##{key.id}",  "unlock #{door}", "open #{door}", "go #{door}", "close #{door}", "lock #{door}", "wear ##{key.id}"
 end