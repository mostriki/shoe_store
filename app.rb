require("bundler/setup")
Bundler.require(:default)


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @stores = Store.all
  erb(:index)
end

post('/') do
  name = params['name']
  @stores = Store.create({name: name})
  redirect('/')
end

get("/stores/:id") do
  @store = Store.find(params[:id])
  erb(:store)
end

post("/stores/:id") do
  @store = Store.find(params[:id])
  name = params['brand']
  price = params['price']
  @shoe = Shoe.create({brand: name, price: price})
  @store.shoes.push(shoe)
  erb(:store)
end
