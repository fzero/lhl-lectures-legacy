#!/usr/bin/env ruby

# ^ That is a hashbang (also known as crunchbang).
# It tells the operating system to use ruby to run this file.
#
# This is entirely optional, but if you want to run your ruby files
# directly without typing "ruby scriptname.rb" in the terminal, this is
# how you do it:
#
# 1. Add "#!/usr/bin/env ruby" to the top of the script
# 2. Make the file executable with: "chmod a+x <your file here>" on the terminal
#
# After that, just type "./scriptname.rb" and the file will run!

developers = [
  {
    name: 'Scott',
    languages: ['Ruby', 'Javascript', 'SQL'],
    experience: 3
  },
  {
    name: 'John',
    languages: ['Javascript', 'SQL', 'Java'],
    experience: 5
  },
  {
    name: 'Mary',
    languages: ['Javascript', 'SQL', 'Fortran'],
    experience: 10
  },
  {
    name: 'Shania',
    languages: ['SQL', 'Java', 'R'],
    experience: 1
  }
]


def junior?(dev)
  dev[:experience] < 2
end


def senior?(dev)
  dev[:experience] >= 5
end


# Iterates over the Array developers, storing each element in turn
# into the local variable `dev` on the following block.
developers.each do |dev|
  # Each element inside the Array is a Hash, so we can access values through keys.
  puts "\n\n#{dev[:name]} knows #{dev[:languages].join(', ')} and has #{dev[:experience]} years of experience."
  if junior?(dev)
    puts "#{dev[:name]} is a Junior developer."
  elsif senior?(dev)
    puts "#{dev[:name]} is a Senior developer."
  else
    puts "#{dev[:name]} is getting there."
  end

  puts "\n-----"
  # Iterates over each key/value pair on dev. For each
  # element in the hash, the key will be stored into
  # `key` and the corresponding value into `value`.
  dev.each do |key, value|
    puts "#{key} = #{value}"
  end
  puts "-----\n"
end
