class ProductsController < ApplicationController
  def billing
    @products = Product.includes(:reduction).all
  end

  def bill
    @total_bill = 0
    total_bill = []
    total_bill = bill_params.map do |param|
      Products::BillingService.new(product_id: param[:id], quantity: param[:quantity]).call!
    end
    @total_bill = total_bill.reduce(:+)
    render json: { total: @total_bill }
  end

  protected
  def bill_params
    params.require(:product).each { |param| param.permit(:quantity, :id) }
  end
end
