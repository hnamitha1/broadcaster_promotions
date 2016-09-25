require 'order'

describe Order do
    describe '#add' do
        let(:delivery_discount) {double name: :express, price: 20 }
        let(:price_discount) {double threshold: 30, discount_percentage: 10 }
        let(:material) { double identifier: 'WNP/SWCL001/010' }
        let(:order) { Order.new(material, delivery_discount, price_discount) }
        let(:delivery) { double name: :standard, price: 10 }
        let(:broadcaster) { double id: 1, name: 'Viacom' }
    
        it 'accepts an delivery and stores it' do
            expect(order.add(delivery, broadcaster)).to be_truthy
        end
    
        it 'raises ArgumentError for a nil delivery' do
            expect { order.add(nil, nil) }.to raise_error ArgumentError
        end
    end
    
    describe '#total' do
        let(:delivery_discount) {double name: :express, price: 20 }
        let(:price_discount) {double threshold: 30, discount_percentage: 10 }
        let(:material) { double identifier: 'WNP/SWCL001/010' }
        let(:order) { Order.new(material, delivery_discount, price_discount) }
        let(:delivery1) { double name: :standard, price: 10.0 }
        let(:delivery2) { double name: :standard, price: 10.0 }
        let(:delivery3) { double name: :express, price: 20.0 }
        let(:broadcaster1) { double id: 1, name: 'Viacom' }
        let(:broadcaster2) { double id: 2, name: 'Disney' }
        
        before do
          order.add(broadcaster1, delivery1)
          order.add(broadcaster2, delivery2)
        end
    
        it 'sums all products and returns the value' do
            expect(delivery_discount).to receive(:discount).with([[broadcaster1, delivery1], [broadcaster2, delivery2]], 20.0)
            .and_return 0
            expect(price_discount).to receive(:discount).with([[broadcaster1, delivery1], [broadcaster2, delivery2]], 20.0).and_return 0
            expect(order.total).to eq 20.0
        end
    end

end