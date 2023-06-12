class Category < ApplicationRecord

  #Adding associations
  has_many :products
end
