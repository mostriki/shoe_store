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
  erb(:index)
end

get("/store/:id") do
  @store = Project.find(params['id'].to_i())
  erb(:store)
end

post("/store/:id") do
  name = params['name']
  volunteer = Shoe.create({brand: brand, price: price})
  @store = Project.find(params['id'].to_i())
  erb(:store)
end
