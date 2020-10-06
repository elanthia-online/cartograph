loop { wait_until { Spell[704].affordable? }
 result = cast(704, 'scroll')
 break unless result =~ /Spell Hindrance/ }