class ProductsView

  def index(records)
    model = ProductTableModel.new(records)
    table = Qt::TableView.new
    table.model = model
    table.show
  end

  def example(records)
    require 'app/ui_presenters/main.rb'

    a = Qt::Application.new(ARGV)
    main = Main.new(nil, records)
    main.show
    a.exec
  end
           
end
