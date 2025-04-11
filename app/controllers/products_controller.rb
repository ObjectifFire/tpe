class ProductsController < ApplicationController
  def billing
    @products = Product.includes(:reduction).all.limit(15)
  end

  def bill
    calculate_bill_price
    
    render json: { total: @total_bill.reduce(:+) }
  end

  protected

  def calculate_bill_price
    @total_bill = bill_params.map do |param|
      Products::BillingService.new(product_id: param[:id], quantity: param[:quantity]).call!
    end
  end

  def bill_params
    params.require(:product).each { |param| param.permit(:quantity, :id) }
  end
end
