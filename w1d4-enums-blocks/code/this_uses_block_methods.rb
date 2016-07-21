require_relative 'my_block_methods'

# Now I can use all methods defined in my_methods.rb
receiver { puts "I'm the block!" }

html = content_tag("div") do
  content_tag("p") do
    "Once upon a time there was a paragraph inside a div."
  end
end

puts html

repeater(10) {|n| puts "received #{n}"}

even_repeater(10) {|n| puts "received #{n}, and it should be even!"}

yield_twice do |from_block|
  puts "This is the block - this came from yied: #{from_block}"
end
