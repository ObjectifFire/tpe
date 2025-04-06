class Reduction < ApplicationRecord
  belongs_to :product

  REDUCTIONS_AMOUNT = [ 50, 30 ].freeze

  def choose_rule(quantity)
   total = fifty_percent_reduction_rule(quantity)
   total = thirty_percent_reduction_rule(quantity) unless total
   total
  end

  def fifty_percent_reduction_rule(quantity)
    return unless amount.in?(REDUCTIONS_AMOUNT)

    if quantity.even?
      apply_reduction(quantity)
    else
      apply_reduction(quantity - 1) + product.price
    end
  end

  def thirty_percent_reduction_rule(quantity)
    return unless amount.in?(REDUCTIONS_AMOUNT)

    if quantity.odd? && quantity >= 3
      apply_reduction(quantity)
    else
      apply_reduction(quantity - 1) + product.price
    end
  end

  protected
    def apply_reduction(quantity)
      total_price = product.price * quantity
      total_price - total_price * (amount / 100)
    end
end
