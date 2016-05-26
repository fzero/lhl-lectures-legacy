# Ruby intro

* Using irb / pry
    - `irb` is built in Ruby
    - `pry` needs to be installed with `gem install pry`
    - There's another gem called `pry-coolline` that makes pry even cooler!
* Running ruby scripts
    - `ruby <your script file here>`
* Basic input/output
    - puts / gets
    - See `hello.rb`
* Ruby types
    - Strings
        + Are a collection of bytes that spell words, text and so on.
        + Can *actually* be treated as an Array of characters if you want!
            + `'abcde'[0]` => `'a'`
            + `'abcde'[0..2]` => `'abc'`
        + Single-quoted strings are treated literally, while double-quoted strings can do tricks like:
            + Interpolation: `name = 'Fabio'; puts "Hello #{name}!"` => `Hello Fabio!`
            + Interpreting special characters, like `\n` (new line). See `developers.rb`.
    - Symbols
        + Used to name things. **They are not Strings**, and are generally used as keys in Hashes.
        + When used alone, they're defined with a leading `:`, like this: `:symbol`
        + When used as Hash keys, they can be written with a _trailing_ colon to make reading easier: `{hello: 'there'}`
        + The example above is **exactly the same** as `{:hello => 'there'}`
    - Fixnum/Float - numbers
        + An integer operation **won't be converted automatically to Float**:
            * `5 / 2` => `2`
            * `5 / 2.0` => `2.5`
    - Boolean - true/false
        + truthy and falsey:
            * The only two falsey values in Ruby are `false` and `nil`
            * Absolutely everything else is intepreted as `true`
    - Array
        + Ordered collection of things
        + Can contain anything, including other arrays
        + `arr = [1, 2, "banana", {name: 'Fabio'}, ['Toronto', 'Montreal', 'Vanvouver']]`
        + The elements are numbered from zero so `arr[2]` would return `"banana"` for the array above.
        + To get nested elements add more square brackets:
            * `arr[4][1]` => `"Montreal"`
            * `arr[3][:name]` => `"Fabio"`
    - Hash
        + Unordered collection of named elements
        + The names are called **keys** and the elements are **values**
        + Keys are unique in a Hash, and are used inside square brackets to get the values:
            * `hsh = {name: 'Mary', status: 'Eating ice cream'}`
            * `hsh[:name]` => `"Mary"` 
            * `hsh[:status]` => `"Eating ice cream"`
        + While keys are usually symbols, they can be anything:
            * `madness = {{a:1} => "What is this?", [1,2,3] => "I can't even", 10000 => "Maniacs"}`
            * `madness[{a:1}]` => `"What is this?"`
* Methods
    - Created with the `def` keyword
    - The last value in the method is automatically the return value of the method
    - Method parameters become local variables inside the method
    - Conventions:
        + Methods ending with a `?` are expected to return a boolean value. See `junior?` and `senior?` on `developers.rb`
        + Methods ending with a `!` are destructive, which means they change the data being fed into them.
