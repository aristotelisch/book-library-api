class BookDecorator < SimpleDelegator
  def self.wrap(collection)
    collection.map(&method(:new))
  end


  def formatted_date_of_creation
    date_of_creation.strftime('%d/%m/%Y')
  end

  def truncated_description
    begin
      description.length > 100 ? description[0, 100] + '...' : description
    rescue
      ''
    end
  end
end