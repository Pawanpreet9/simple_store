# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'csv'

=begin



676.times do
  Product.create(
    title: Faker:: Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    stock_quantity: Faker::Number.between(from:0, to: 2000)
  )
end
=end

#Clearing data
Product.destroy_all

Category.destroy_all

#Looping
csv_file = Rails.root.join('db/products.csv')
   csv_data = File.read(csv_file)

   products = CSV.parse(csv_data, headers: true)

   # If CSV was created by Excel in Windows you may also need to set an encoding type:
    #products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

   products.each do |product|

     # Create categories and products here.
   category_name = product["category"]

     category = Category.find_or_create_by(name: category_name)
    category_id  = category = Category.find_or_create_by(name: category_name).id
     product = Product.create(title: product["name"],
                              description: product["description"],
                             price: product["price"],
                            stock_quantity: product["stock quantity"],
                            category_id: category_id
                          )

                          if product.save
                            puts "Product created successfully!"
                          else
                            puts "Error creating product: #{product.errors.full_messages.join(', ')}"
                          end
   end