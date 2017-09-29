require('spec_helper')

describe Store do
  describe '#name' do
    it 'returns the name of a shoe store' do
      test_store = Store.create({name: 'Blundstone', id: nil})
      expect(test_store.name).to eq 'Blundstone'
    end
  end

  describe(Store) do
    it { should have_many(:shoes) }
  end
end
