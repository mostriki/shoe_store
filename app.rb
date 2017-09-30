require("bundler/setup")
Bundler.require(:default)


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @stores = Store.all
  erb(:index)
end

post('/test') do
  name = params['name']
  @stores = Store.create({name: name})
  redirect('/')
end

get("/stores/:id") do
  @store = Store.find(params[:id])
  @shoes = Shoe.all
  erb(:store)
end

post("/stores/:id") do
  name = params['brand']
  price = params['price']
  @store = Store.find(params[:id])
  @shoe = Shoe.create({brand: name, price: price})
  @store.shoes.push(@shoe)
  erb(:store)
end
