

# def some_method(b)
#   b = 3
# end

# a=5
# some_method(a)
# puts a
# #puts b



# def some_method(b)
#    b.upcase!
# end

# a = 'original string'
# some_method(a)
# puts a

def some_method(b)
  #b = {}
  b[1] = "Changed Some more"
end

a = {1 => "Some", 2 => "Some more"}
some_method(a)
puts a


