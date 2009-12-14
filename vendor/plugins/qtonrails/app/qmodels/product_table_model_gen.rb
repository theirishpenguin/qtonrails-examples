class ProductTableModel < Qt::AbstractTableModel

    def initialize(records)
        super()
        @records = records
    end

    def rowCount(parent)
        @records.size
    end

    def columnCount(parent)
        @@column_titles.length
    end

    def data(index, role=Qt::DisplayRole)
        invalid = Qt::Variant.new
        return invalid unless role == Qt::DisplayRole or role == Qt::EditRole
        record = @records[index.row]
        return invalid if record.nil?

        index_column_available? index 

        column_title = @@column_titles[index.column]
        value = record[column_title.name] || ''
        return Qt::Variant.new(value)
    end

    def headerData(section, orientation, role=Qt::DisplayRole)
        invalid = Qt::Variant.new
        return invalid unless role == Qt::DisplayRole

        v = case orientation
        when Qt::Horizontal
          @@column_titles.map{|ct| ct.value}[section]
        else
          ""
        end
        return Qt::Variant.new(v)
    end

    def flags(index)
        return Qt::ItemIsEditable | super(index)
    end

    def setData(index, variant, role=Qt::EditRole)
        if index.valid? and role == Qt::EditRole
            s = variant.toString
            record = @records[index.row]

            index_column_available? index 
            
            column_title_name = @@column_titles[index.column].name
            
            if record[column_title_name].kind_of? Fixnum
                record[column_title_name] = s.to_i
            elsif record[column_title_name].kind_of? String
                record[column_title_name] = s
            else
                raise 'Column Type not yet supported'
            end

            record.save

            emit dataChanged(index, index)
            return true
        else
            return false
        end
    end

    private
    def index_column_available?(index)
        if index.column >= @@column_titles.length
            raise "invalid column #{index.column}" 
        end
    end
end

