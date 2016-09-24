require 'price_discount'

describe PriceDiscount do
    subject(:total_price) {described_class.new(30, 10)}
    let(:delivery) { [double, double] }
    
    describe '#discount' do
        it 'calculates the discount if above the threshold' do
            expect(total_price.discount(delivery, 31)).to eq 3.1
        end
            
        it 'returns zero if the total is below the threshold' do
            expect(total_price.discount(delivery, 29)).to eq 0
        end
  end
    
end