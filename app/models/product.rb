class Product < ApplicationRecord
  has_one :reduction

  def reduction_avaiable?
    reduction.present? && reduction.avaiable?
  end
end
