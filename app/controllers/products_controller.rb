class ProductsController < ApplicationController

  def index
    #To load all the products.
   # @products = Product.all
   @products = Product.includes(:category).all
  end
 def show
  @product = Product.find(params[:id])
 end

end
