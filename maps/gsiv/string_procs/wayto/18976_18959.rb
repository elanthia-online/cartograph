loop { wait_until { Spell[704].affordable? }
 result = cast(704, 'paneling')
 break unless result =~ /Spell Hindrance/ }