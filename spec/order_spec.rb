require 'order'

describe Order do
    describe '#add' do
        let(:order) { Order.new(material, []) }
        let(:material) { double identifier: 'WNP/SWCL001/010' }
        let(:delivery) { double name: :standard, price: 15 }
        let(:broadcaster) { double id: 1, name: 'Viacom' }
    
        it 'accepts an delivery and stores it' do
            expect(order.add(delivery, broadcaster)).to be_truthy
        end
    
        it 'raises ArgumentError for a nil delivery' do
            expect { order.add(nil, nil) }.to raise_error ArgumentError
        end
    end

end