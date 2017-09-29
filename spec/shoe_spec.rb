require('spec_helper')

describe Shoe do
  describe '#brand' do
    it 'returns the name of a shoe brand' do
      test_brand = Shoe.create({brand: 'Nike', price: 80, :id => nil})
      expect(test_brand.brand).to eq 'Nike'
    end
  end

  describe '#price' do
    it 'returns the price of a shoe brand' do
      test_price = Shoe.create({brand: 'Nike', price: 80, :id => nil})
      expect(test_price.price).to eq 80
    end
  end

  describe(Shoe) do
    it { should have_many(:stores) }
  end
end
