productos = {'bebida' => 850, 'chocolate' => 1200, 'galletas' => 900, 'leche' => 750}

puts "1.- ************"
productos.each { |producto, valor| puts producto }

puts "2.- ************"
productos['cereal'] = 2200
puts productos

puts "3.- ************"
productos['bebida'] = 2000
puts productos

puts "4.- ************"
productos1 = productos.to_a
puts productos1.inspect

puts "5.- ************"
productos.delete('galletas')
puts productos



