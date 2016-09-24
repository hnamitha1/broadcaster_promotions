require 'material'

describe Material do
    subject(:material) {described_class.new('WNP/SWCL001/010') }
    
    describe '#identifier' do
        it 'returns the identifier of the Broadcaster' do
            expect(material.identifier).to eq 'WNP/SWCL001/010'
        end
    end    
end
