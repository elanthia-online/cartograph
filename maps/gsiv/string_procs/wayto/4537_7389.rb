%w(circular triangular square rectangular).each{|d| dothistimeout "push #{d} depression", 3, /\*[A-Z]+\*$/}
fput "stand" until standing?