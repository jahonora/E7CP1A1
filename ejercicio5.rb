meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo']
ventas = [2000, 3000, 1000, 5000, 4000]

meses_ventas = {}
meses.each_with_index{ |e, i| meses_ventas[e] = ventas[i] }

puts meses_ventas

meses_ventas1 = meses_ventas.invert
puts meses_ventas1

max_ventas = 0
meses_ventas1.each{|k,v| max_ventas = k if max_ventas < k}
puts max_ventas