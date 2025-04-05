class Products::TicketEditionService
  def initialize(attr = {})
    @product = Product.find(attr[:product_id])
    @quantity = attr[:quantity]
  end

  def call!
    @product.reduction.present? ? price_with_reduction : price_without_reduction
  end

  protected

    def price_without_reduction
      @product.price * @quantity
    end

    def price_with_reduction
    total_price = @product.price * @quantity
    total_price - (total_price * (@product.reduction.amount / 100))
    end
end

# Call me this way
# price = Products::TicketEditionService.new(product_id: Product.find(7).id, quantity: 4).call!
