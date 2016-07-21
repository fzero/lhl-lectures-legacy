# Review of arrays and hashes

@array_of_hashes = [
  {name: "Fabio", location: "LHL"},
  {name: "Bob", location: "Bob's Burgers"},
  {name: "Teddy", location: "Being a teddy bear, just chillin'"},
  {name: "Betty", location: "Bob's Girlfriend, but... I don't know?"}
]

@array_of_arrays = [
  [1,2,3],
  [4,5,6],
  ["Banana", "Apples"],
  [
    {'another_array' => ["OHAI", "HELLO", "Alô", "Oi", "Coé"]},
  ]
]

# Iterate over both levels!
@array_of_arrays.each do |outer_el|
  outer_el.each do |inner_el| # <- .each inside .each
    if inner_el.is_a?(Hash)
      inner_el.each do |key, value|
        # ... do whatever
      end
    else
      puts inner_el
    end
  end
end


def count_to_number(number)
  unless number.is_a?(Integer)
    puts "#{number} is not a number, therefore it isn't cool."
    return
  end

  (0..number).each do |n|
    puts "Number #{n}"
  end
end
