personas = ["Carolina", "Alejandro", "Maria Jesús", "Valentín"]
edades = [32, 28, 41, 19]

personas_hash = {}
personas.each_with_index{ |e, i| personas_hash[e] = edades[i] }

puts personas_hash

def promedio_edad(p_hash)
	suma = p_hash.reduce(0){|sum,(k,v)| sum+=v}
	suma/p_hash.count
end

puts promedio_edad(personas_hash)

