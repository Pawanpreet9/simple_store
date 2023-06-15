#   Name: Pawanpreet Kaur
#   Date: June 15, 2023
#   Challenge5

class Product < ApplicationRecord

#validation
validates :title, :price, :stock_quantity, presence: true

# Adding association
belongs_to :category
end
