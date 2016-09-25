require 'delivery_discount'

describe DeliveryDiscount do
  


  describe '#discount' do
    let(:delivery) { double name: :express, price: 20 }
    let(:broadcaster) { double id: 1, name: 'Viacom' }
    #let(:item_data) { [double(delivery) , double(broadcaster)] } 
    let(:deliveries) { [[broadcaster, delivery], [broadcaster, delivery]] }
    #let(:deliveries) { [double(broadcaster), double(delivery)]}
    subject(:pricing_rule) { DeliveryDiscount.new(:express, 15, 2) }
  
    it 'returns the discount amount' do
      expect(pricing_rule.discount(deliveries, 40)).to eq 15
    end
    
    it 'returns zero' do
      expect(pricing_rule.discount([], 0)).to eq 0
    end
  end
end