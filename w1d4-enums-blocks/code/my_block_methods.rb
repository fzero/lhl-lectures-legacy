# This is a file with a bunch of block methods.
# I can `require` this file and use whatever is inside.

def content_tag(tag_name)
  result = "<#{tag_name}>"
  result << yield
  result << "</#{tag_name}>"
  result
end

def chinese_cookie
  puts "#{yield} in bed."
  puts "Now you're covered in crumbles."
end

def repeater(repeats)
  (1..repeats).each do |number|
    yield number
  end
end

def even_repeater(repeats)
  (1..repeats).each do |number|
    yield number if number % 2 == 0
  end
end

def receiver
  puts "Before the block"
  yield
  puts "After the block"
end

def yield_twice
  puts "Before"
  yield "this is coming from the block"
  yield "this is coming from the block again"
  puts "After"
end

# Note that `require` actually runs the code, so when this file is required
# from `caller.rb`, this message will be printed.
puts "\n\nI've been required\n\n"
