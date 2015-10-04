require 'faker'

# Create tags
Tag.destroy_all
%w(cool hot interesting boring mambo shizzle awesome).each do |t|
  Tag.create(tag: t)
end

# Create random categories
Category.destroy_all
20.times do
  Category.create(
    name: Faker::Commerce.department,
    available: (rand(2) > 0)
  )
end

# Create random products
Product.destroy_all
200.times do
  product = Product.new(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: rand(1000),
    quantity_in_stock: (rand(10) > 3) ? rand(50) : 0,
    category: Category.all.to_a.sample
  )
  # 1-4 Add tags to 60% of all products
  all_tags = Tag.all.to_a
  if (rand(10) > 4)
    tags_to_add = []
    (rand(4) + 1).times do
      tags_to_add << all_tags.sample
    end
    product.tags = tags_to_add.uniq
  end
  product.save!
end
