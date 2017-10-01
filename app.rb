require("bundler/setup")
Bundler.require(:default)


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @stores = Store.all
  # @shoes = Shoe.all
  erb(:index)
end

# Create and edit store locations
post('/stores') do
  name = params['name']
  @stores = Store.create({name: name})
  if @stores.save
    redirect('/')
  else
    erb(:store_error)
  end
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
  Store.destroy(params[:id])
  redirect('/')
end

patch("/stores/:id/update") do
  name = params['name']
  @store = Store.find(params[:id])
  Store.update({name: name})
  redirect("/stores/#{@store.id}")
end

# Create and edit shoe brands
get('/brand/:id') do
  @shoe = Shoe.find(params[:id])
  @stores = Store.all
  erb(:shoe)
end

post('/brand/:id') do
  store = params['store']
  redirect('/')
end

get("/brand/:id/delete") do
  Shoe.destroy(params[:id])
# works but doesn't redirect("/stores/#{@store.id}")
  redirect("/")
end
