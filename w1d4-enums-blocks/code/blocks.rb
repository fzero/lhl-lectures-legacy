def chinese_cookie
  puts "#{yield} in bed."
end


def repeater(repeats)
  (1..repeats).each do |number|
    yield number
  end
end


def receiver
  puts "Before the block"
  yield
  puts "After the block"
end

receiver { puts "I'm the block!" }


def repeater(repeats)
  (1..repeats).each do |number|
    yield number
  end
end

repeater(10) {|n| puts "received #{n}"}


def even_repeater(repeats)
  (1..repeats).each do |number|
    yield number if number % 2 == 0
  end
end

even_repeater(10) {|n| puts "received #{n}"}


