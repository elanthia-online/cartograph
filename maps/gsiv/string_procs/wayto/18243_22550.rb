%w(18245 20321 20319 20318 20317 20316 20315 20278 20279 20327 20328 20325 20329 20330 20333 20336 20339 20177 20347 20348 20350 20352 20353 20122 20108 20107 20085 20106 20111 20117 20121 20324 20323 20322 20263 20264 20266 20269 20126 20125 20123 20109 20140 20192 20190 20189 20184 20178 20175 20307 20305 20304 20303 20300 20298 20275 20288 20291 20292 20295 20297 20272 20165 20256 20260 20143 20141 20128 20145 20151 20156 20160 20164 20170 20193 20196 20198 20167 20208 20210 20213 20255 21386).each{|id| force_start_script('go2', [id])
wait_while{Script.running.count{|s| s.name == 'go2'} == 2}
break if GameObj.loot.collect{|i| i.noun}.include?('doorframe')}
move 'go doorframe'