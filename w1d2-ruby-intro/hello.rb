def get_name
  gets.chomp
end

def greeting
  puts "Hello there beautiful person! What is your name?"
end

greeting
name = get_name
puts "Well good morning, #{name}!"
