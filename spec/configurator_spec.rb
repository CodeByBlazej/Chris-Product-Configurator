require_relative '../lib/configurator'

describe Configurator do
  subject(:configurator) { described_class.new }

  describe '#select_fronts' do

    context 'User makes a typo first and then gives good answer' do
    
      before do
        allow(configurator).to receive(:puts)
        allow(configurator).to receive(:gets).and_return('cold', 'gold')
      end
      
      it 'ask user to select range of fronts and assign it to variable' do
        expect(configurator).to receive(:puts).with('Oops! Looks like typo, please type again...').once
        configurator.configure_product
        expect(configurator.front_range_selected).to eq('gold')
      end
    end
  end
end