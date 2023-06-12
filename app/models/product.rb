class Product < ApplicationRecord
#validation
validates :title, :price, :stock_quantity, presence: true

# Adding association
belongs_to :category
end
