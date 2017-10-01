require('spec_helper')

describe Store do
  it { should have_many(:shoes) }

  describe '#name' do
    it 'returns the name of a shoe store' do
      test_store = Store.create({name: 'Blundstone', id: nil})
      expect(test_store.name).to eq 'Blundstone'
    end
  end

  it 'will validate the presence of a store' do
    store = Store.new({name: ""})
    expect(store.save()).to(eq(false))
  end


  it 'will ensure the lenght of a store name is at most 100 characters' do
    store = Store.new({name: "a".*(101)})
    expect(store.save).to(eq(false))
  end

  it 'will validate the uniqueness of a store' do
    store1 = Store.new({name: "Blundstone"})
    store1.save
    store2 = Store.new({name: "Blundstone"})
    store2.save
    expect(store1.save()).to(eq(true))
    expect(store2.save()).to(eq(false))
  end

  it("will convert the first letter in each word of the name to uppercase") do
    store = Store.create({name: "foot locker"})
    expect(store.name()).to(eq("Foot Locker"))
  end
end
