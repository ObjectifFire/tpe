require 'rails_helper'

RSpec.describe Products::BillingService, type: :service do
  let(:product) { FactoryBot.create(:product) }
  let(:reduction) { FactoryBot.create(:reduction, product:) }
  let(:quantity) { 2 }
  context '' do
    describe '' do
       it '' do
        expect(Products::BillingService.new({ product_id: product.id, quantity: }).call!).to eq(product.price * quantity)
       end
    end
  end
end
