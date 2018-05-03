restaurant_menu = { "Ramen" => 3, "Dal Makhani" => 4, "Coffee" => 2 }

plato_max = 0
restaurant_menu.each{|k,v| plato_max = v if plato_max < v}
puts plato_max

plato_min = 1000
restaurant_menu.each{|k,v| plato_min = v if plato_min > v}
puts plato_min

plato_prom = 0
plato_suma = restaurant_menu.reduce(0){|sum, (k,v)| sum += v}
plato_prom = plato_suma/restaurant_menu.count
puts plato_prom

nombres_platos = restaurant_menu.map{|k,v| k}
puts nombres_platos.inspect

valores_platos = restaurant_menu.map{|k,v| v}
puts valores_platos.inspect

restaurant_menu.each{|k,v| restaurant_menu[k] = v*1.19}
puts restaurant_menu

restaurant_menu.each{|k,v| restaurant_menu[k] = v*0.8 if k.split.count > 1}
puts restaurant_menu

