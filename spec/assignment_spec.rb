require('spec_helper')

describe Assignment do
  describe '#shoe_id' do
    it 'returns the id of a shoe brand' do
      test_brand = Assignment.create({shoe_id: 1, store_id: 1})
      expect(test_brand.shoe_id).to eq 1
    end
  end


  describe '#store_id' do
    it 'returns the id of a store' do
      test_store = Assignment.create({shoe_id: 1, store_id: 1})
      expect(test_store.store_id).to eq 1
    end
  end

  describe Assignment do
    it { should belong_to(:shoe) }
  end

  describe Assignment do
    it { should belong_to(:store) }
  end
end
