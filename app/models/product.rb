class Product < ShopifyAPI::Product    #Note: ShopifyAPI::Product extends ActiveResource::Base
  schema do
    # define each attribute separately
    attribute 'title', :string
  end
end