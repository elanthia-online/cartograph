loop { wait_until { Spell[704].affordable? }
 result = cast(704, 'banner')
 break unless result =~ /Spell Hindrance/ }