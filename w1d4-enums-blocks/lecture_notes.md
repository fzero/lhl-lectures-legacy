# W1D4 - Regex recap! Enumerables! Blocks! Multiple files! Debugging!

Hold on tight, there's a lot to cover today!

## Regexes in Ruby (quick recap)

* First the simple stuff: Use `=~` to find things that match and `!~` to find things that don't match
* Match groups: within a Regex, anything inside round brackets is a **group** and can be accessed separately
* Using `String#match` to get a `MatchData` object and using it to:
    - get a match: `match.to_s`
    - get stuff before/after the match: `match.pre_match`/`match.post_match`
    - get match groups using `match.captures`
* Use `String#scan` to get all matches in a string as an array
* Using `String#gsub` to replace all matches on a string

## Enumerables

Enumerable means two things in Ruby: a class of objects that represent a collection and the `Enumerable` module (or **mixin**), which is something we'll see in more detail later.

All enumerables provide an assortment of methods to iterate over and manipulate the elements of a collection. These methods are included by default in `Array`, `Range` and `Hash`.

Among other things, `Enumerable` provides the `each` method. This means all  examples below work the same way:

```ruby
# Array
[1, 2, 3].each {|n| puts n}

# Range
(1..3).each {|n| puts n}

# Hash
{num1: 1, num2: 2, num3: 3}.each {|key, n| puts "key: #{key} / number: #{n}"}
```

Another common use is `select`, which filters an enumerable based on a condition:

```ruby
# Returns an array containing only even numbers
(1..10).select {|n| n % 2 == 0}
#=> [2, 4, 6, 8, 10]

# Returns all strings matching a regex
['Tony', 'Toni', 'Thomas'].select {|name| name =~ /Ton/}
#=> ['Tony', 'Toni']
```

Other all-time favourites are `map`, `reject`, `sort`, `find`.

`Enumerable` mixin reference: http://ruby-doc.org/core-2.3.0/Enumerable.html

Most `Enumerable` methods take a **block** as a parameter, which is a nice segue!

## Blocks and yielding

Put simply, a block a bit of code inside a pair of curly braces or `do..end` pair. But the cool thing about blocks is they can be passed as a parameter to a method.

In other words **blocks are used to insert a bit of code inside a method** and methods that take a block **wrap that block into a piece of code**.

The keyword `yield` is used inside the receiving methods as sort of a placeholder to where the block will run.

```ruby
def receiver
  puts "Before the block"
  yield
  puts "After the block"
end

receiver { puts "I'm the block!" }
# Before the block
# I'm the block!
# After the block

# Here's a useful example: wrapping some text into HTML tags
def content_tag(tag_name)
  result = "<#{tag_name}>"
  result << yield
  result << "</#{tag_name}>"
  result
end

content_tag("p") do
  "Once upon a time there was a turtle named Martin."
end
#=> "<p>Once upon a time there was a turtle named Martin.</p>"
```

But what about the pattern we've used with `Enumerable` methods? In that case the method that receives the block **sends a value back to the block**. That value is stored in the variable defined inside the chute operator: `|var|`

```ruby
def repeater(repeats)
  (1..repeats).each do |number|
    yield number
  end
end

repeater(10) {|n| puts "received #{n}"}
# received 1
# received 2
# ...
# received 10

# Of course we can make this more interesting
def even_repeater(repeats)
  (1..repeats).each do |number|
    yield number if number % 2 == 0
  end
end

even_repeater(10) {|n| puts "received #{n}"}
# received 2
# received 4
# ...
# received 10
```

This may look a bit stupid with a silly example like this, but take the very common situation where you need to process the contents of a file:

```ruby
  File.open("myfile.txt", "r") do |myfile|
    contents = myfile.read
    puts contents
  end
```

When `File.open` receives a block, it `yield`s a object representing `myfile.txt`, which is assigned to the `myfile` variable. We can now use `myfile.read` to get the contents. At the end of the block, `File.open` will take care of closing the file. Pretty neat!

Finally, you can check if a method is being called with a block by using `block_given?`.

```ruby
def repeater(repeats)
  return "I need a block!" unless block_given?
  (1..repeats).each do |number|
    yield number
  end
end

repeater(10)
# "I need a block!"
```

Additional material on blocks: http://www.tutorialspoint.com/ruby/ruby_blocks.htm

## Working with multiple Ruby files

Most code you're working on right now is pretty short, but as complexity grows you'll want to break down your code in separate files. You'll still need everything to work as a unit. That's why Ruby has `require` and `require_relative`.

```ruby
# require needs the full path
require './my_code/my_methods.rb'

# require_relative looks for files based on the current folder, so if we're
# inside "/my_code"...
require_relative "my_methods.rb"
```

`require` is also used to load gems and libraries. In that case, you shouldn't include directories or extensions.

```ruby
require 'pry'
require 'httparty'
```

## Debugging

You can `require` the `pry` gem in your scriptsto have access to a debugger. Include the line `binding.pry` anywhere to add a breakpoint to examine variables, investigate errors and so on.

```ruby
require 'pry'

def broken_method(name)
  if name = "Fabio"
    binding.pry # <=== code will stop here and a pry prompt will be shown
    puts "That guy is awesome!"
  end
end
```
