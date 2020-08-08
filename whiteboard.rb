# File to write random code from the book

def say_goodnight(name)
    result = "Good night, #{name.capitalize}"
    return result
end

puts say_goodnight('Mary-Ellen')
puts say_goodnight 'John-Boy'