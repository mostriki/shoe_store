require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @stores = Store.all()
  erb(:index)
end

post('/') do
  name = params['name']
  @stores = Store.create({name: name})
  redirect('/')
end

# get("/stores/:id") do
#   @store = Store.find(params['id'].to_i())
#   erb(:store_info)
# end
#
# post("/stores/:id") do
#   name = params['name']
#   volunteer = Shoe.create({brand: brand, price: price, id: nil})
#   @store = Store.find(params['id'].to_i())
#   erb(:store_info)
# end
