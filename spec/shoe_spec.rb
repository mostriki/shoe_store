require('spec_helper')

describe Shoe do
  it { should have_many(:stores) }

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

  it 'will validate the presence of a brand' do
    shoe = Shoe.new({brand: ""})
    expect(shoe.save).to(eq(false))
  end

  it 'will ensure the lenght of a brand name is at most 100 characters' do
    shoe =  Shoe.new({brand: "a".*(101)})
    expect(shoe.save).to(eq(false))
  end

  it 'will validate the uniqueness of a brand' do
    shoe1 = Shoe.new({brand: "Nike"})
    shoe1.save
    shoe2 = Shoe.new({brand: "Nike"})
    shoe2.save
    expect(shoe1.save()).to(eq(true))
    expect(shoe2.save()).to(eq(false))
  end

  it("will convert the first letter in each word of the brand to uppercase") do
    shoe = Shoe.create({brand: "nike"})
    expect(shoe.brand()).to(eq("Nike"))
  end
end
