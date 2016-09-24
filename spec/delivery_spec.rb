require 'delivery'

describe Delivery do
    subject(:delivery) {described_class.new(:standard, 10.0) }
    
    describe '#name' do
        it 'returns the name of the delivery' do
            expect(delivery.name).to eq :standard
        end
    end    
     
    describe '#price' do
        it 'returns the price for the delivery' do
            expect(delivery.price).to eq 10.0
        end
    end
end
