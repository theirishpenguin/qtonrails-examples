class ProductsController
  def index
    Product.find(:all)
  end
end
