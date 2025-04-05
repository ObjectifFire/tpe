class ProductsController < ApplicationController
  def tpe
    @products = Product.includes(:reduction).all
  end
end
