loop { wait_until { Spell[704].affordable? }
 result = cast(704, 'mosaic')
 break unless result =~ /Spell Hindrance/ }