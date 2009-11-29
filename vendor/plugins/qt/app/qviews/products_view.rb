class ProductsView

  def index(records)
    model = ProductTableModel.new(records)
    table = Qt::TableView.new
    table.model = model
    table.show
  end

end
