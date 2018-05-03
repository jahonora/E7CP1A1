require 'colorize'
inventario = {"Notebooks": 4, "Pc_escritorio": 6, "Routers": 10, "Impresoras": 6}

def format input
	e = false
	item, stock = input.split(",")
	item.capitalize!
	[item, stock.to_i]
end

def exist? h, item
	e = false
	#first, check if exist
	h.each{|k,v| e = true if h.key?(item.to_sym)}
	e
end

def total h
	h.reduce(0){|sum, (k,v)| sum+=v}
end

def mayor h
	mayor = ["", 0]
	h.each{|k,v| mayor = k,v if mayor[1] < v }
	mayor
end
puts "***************************************"
puts "BIENVENIDO AL MANEJADOR DE INVENTARIO!!".colorize(:color => :white, :background => :blue)
puts "***************************************"
option = -1
mensajes =	["Por favor ingrese el item a agregar y su stock (usar formato tipo: Pendrives, 100): ",
			 "Por favor ingrese el item a eliminar (usar formato tipo: Pendrives): ",
			 "Por favor ingrese el item que desea actualizar y su nuevo stock (usar formato tipo: Pendrives, 100):",
			 "Calculando stock total de items...........",
			 "Revisando el item con mayor stock...............",
			 "Por favor ingrese el item a consultar (usar formato tipo: Pendrives): "]

errores =	["El item ya existe, por favor seleccione la funcion actualizar para editar este item", 
			 "El item no existe, no puede eliminarse el item seleccionado",
			 "El item no existe, no puede actualizarse el item seleccionado",
			 "No hay items",
			 "No hay items con stock",
			 "El item no existe"]

exitos =	["El item fue agregado con exito", 
			 "El item fue eliminado con exito",
			 "El item fue actualizado con exito",
			 "La cantidad total de items es: ",
			 "El item con mayor stock es ",
			 "El item existe y su stock es "]

while option!=7
	puts "INVENTARIO ACTUAL: #{inventario}".cyan
	exist = false
	puts 	"Menu de opciones:
			1. Agregar item
			2. Eliminar item
			3. Actualizar item
			4. Stock total
			5. Item con mayor stock
			6. Buscar si existe un item
			7. Salir".upcase.blue
	print "Por favor ingrese una opcion: ".upcase.yellow
	option = gets.chomp.to_i
	item = ""
	case option
	when 1
		print mensajes[option-1].upcase.yellow
		item, stock = format gets.chomp
		exist = exist?(inventario, item)
		if exist
			puts "ERROR: #{errores[option-1]}".upcase.red
		else
			inventario[item.to_sym] = stock
			puts "#{exitos[option-1]}".upcase.green
		end
	when 2
		print mensajes[option-1].upcase.yellow
		item, stock = format gets.chomp
		exist = exist?(inventario, item)
		if exist
			inventario.delete(item.to_sym)
			puts "#{exitos[option-1]}".upcase.green
		else
			puts "ERROR: #{errores[option-1]}".upcase.red
		end
	when 3
		print mensajes[option-1].upcase.yellow
		item, stock = format gets.chomp
		exist = exist?(inventario, item)
		if exist
			inventario[item.to_sym] = stock
			puts "#{exitos[option-1]}".upcase.green
		else
			puts "ERROR: #{errores[option-1]}".upcase.red
		end
	when 4
		puts mensajes[option-1].upcase.yellow
		total_items = total(inventario)
		if total_items > 0
			puts "#{exitos[option-1]} #{total_items}".upcase.green
		else
			puts "ERROR: #{errores[option-1]}".upcase.red
		end
	when 5
		puts mensajes[option-1].upcase.yellow
		mayor_stock = mayor(inventario)
		if mayor_stock[1] > 0
			puts "#{exitos[option-1]} #{mayor_stock[0]} con un stock de: #{mayor_stock[1]}".upcase.green
		else
			puts "ERROR: #{errores[option-1]}".upcase.red
		end
	when 6
		print mensajes[option-1].upcase.yellow
		item, stock = format gets.chomp
		exist = exist?(inventario, item)
		if exist
			puts "#{exitos[option-1]} #{inventario[item.to_sym]}".upcase.green
		else
			puts "ERROR: #{errores[option-1]}".upcase.red
		end
	when 7
		puts "Adios!!".upcase
	end
end




