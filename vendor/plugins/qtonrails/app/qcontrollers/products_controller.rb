class ProductsController
  def index
    Product.find(:all)
  end

  def example
    Product.find(:all)
  end
end
