if UserVars.mapdb_have_vaalor_papers == 'yes' || GameObj.inv.any? { |i| i.name == 'eahnor wyvern badge' || i.contents.any? { |o| o.name =~ /ivory vellum document|eahnor wyvern badge/ } }
 0.2
 else
 10.0
 end