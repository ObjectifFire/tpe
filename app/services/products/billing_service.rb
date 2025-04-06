class Products::BillingService
  def initialize(attr = {})
    @product = Product.find(attr[:product_id])
    @quantity = attr[:quantity]
  end

  def call!
    @product.reduction_avaiable? ? price_with_reduction : price_without_reduction
  end

  protected
    def price_without_reduction
      @product.price * @quantity
    end

    def price_with_reduction
      @product.reduction.choose_rule(@quantity)
    end
end
