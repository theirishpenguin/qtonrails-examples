class ProductTableModel < Qt::AbstractTableModel

    @@column_titles = [
       NVPair.new('created_at', 'Created at'),
       NVPair.new('title', 'Title'),
       NVPair.new('updated_at', 'Updated at'),
       NVPair.new('description', 'Description')
    ]

end
