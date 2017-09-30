require("bundler/setup")
Bundler.require(:default)


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @stores = Store.all
  erb(:index)
end

post('/stores') do
  name = params['name']
  @stores = Store.create({name: name})
  redirect('/')
end

get("/stores/:id") do
  @store = Store.find(params[:id])
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

delete("/stores/:id/delete") do
  Store.delete(params[:id])
  redirect('/')
end

patch("/stores/:id/update") do
  name = params['name']
  @store = Store.find(params[:id])
  Store.update({name: name})
  redirect("/stores/#{@store.id}")
end
