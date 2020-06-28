phase = Spell[704]
 unless phase.affordable?
 echo 'waiting for mana...'
 wait_until { phase.affordable? }
 end
 phase.cast('shadow')