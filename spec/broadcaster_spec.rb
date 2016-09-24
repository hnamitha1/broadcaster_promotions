require 'broadcaster'

describe Broadcaster do
    subject(:broadcaster) {described_class.new(1, 'Viacom') }
    
    describe '#id' do
        it 'returns the id of the Broadcaster' do
            expect(broadcaster.id).to eq 1
        end
    end    
     
    describe '#name' do
        it 'returns the name of the broadcaster' do
            expect(broadcaster.name).to eq 'Viacom'
        end
    end
end
