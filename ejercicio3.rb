h = {"x": 1, "y":2}

h[:z] = 3
puts h

h[:x] = 5
puts h

h.delete(:y)
puts h

h.each{ |k,v| puts "yeeah" if k == :z}

h1 = h.invert
puts h1
