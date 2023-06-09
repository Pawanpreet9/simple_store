class ProductsController < ApplicationController

  def index
    #To load all the products.
    @products = Product.all
  end
end
