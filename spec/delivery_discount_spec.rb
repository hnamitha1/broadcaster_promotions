require 'delivery_discount'

describe DeliveryDiscount do
    let(:delivery) { { name: :express, price: 20 } }
    let(:deliveries) { [double(delivery), double(delivery)] }
    subject(:pricing_rule) { DeliveryDiscount.new(:express, 15, 2) }


  describe '#discount' do
    it 'returns the discount amount' do
      expect(pricing_rule.discount(deliveries, 40)).to eq 25
    end
    
    it 'returns zero' do
      expect(pricing_rule.discount([], 0)).to eq 0
    end
  end
end