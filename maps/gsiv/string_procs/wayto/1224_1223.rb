Spell[9704].cast if Spell[9704].known? and !Spell[9704].active? and Spell[9704].affordable?
 empty_hands
 fput 'stance offensive' if Skills.climbing < 20
 move 'climb boulder'
 waitrt?
 fput 'stance defensive'
 fill_hands