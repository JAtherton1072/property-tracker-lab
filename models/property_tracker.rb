# pg is a ruby gem which we installed via terminal

  require 'pg'



  class Property


    attr_accessor :address, :value, :number_of_bedrooms, :year_built
    attr_reader :id

     def initialize(details)
       @id = details['id'].to_i if details['id']
       @address = details['address']
       @value = details['value']
       @number_of_bedrooms = details['number_of_bedrooms']
       @year_built = details['year_built']
     end

     def Property.all
       db = PG.connect({ dbname: 'properties', host: 'localhost' })
       sql = "SELECT * FROM properties"
       db.prepare("all", sql)
       properties = db.exec_prepared("all")
       db.close
       return properties.map { |property| Property.new(property) }
     end


     def save
       # save the order to the database
       # connect to the database
       db = PG.connect({ dbname: 'properties', host: 'localhost' })
       sql = "INSERT INTO properties (address, value, number_of_bedrooms, year_built)
       VALUES ($1, $2, $3, $4) RETURNING id"
       my_values = [@address, @value, @number_of_bedrooms, @year_built]
       db.prepare("my_save", sql)
       # execute the SQL query
       new_property = db.exec_prepared("my_save", my_values)
       @id = new_property[0]['id']
       # close the connection to the database
       db.close
    end




    def update

      db = PG.connect({ dbname: 'properties', host: 'localhost' })
      sql = "UPDATE properties
             SET address = $1,
             value = $2,
             number_of_bedrooms = $3,
             year_built = $4 where id = $5"

             db.prepare("my_update", sql)
             values = [@address, @value, @number_of_bedrooms, @year_built, @id]
             db.exec_prepared("my_update", values)
             db.close


    end


    def delete

      db = PG.connect({ dbname: 'properties', host: 'localhost' })


      sql = "DELETE FROM properties
             WHERE id = $1"

             db.prepare("my_delete", sql)
             values = [@id]
             db.exec_prepared("my_delete", values)
             db.close


    end

    def Property.find(id)
      db = PG.connect({ dbname: 'properties', host: 'localhost' })


      sql = "SELECT * FROM properties
             WHERE id = $1"

             db.prepare("my_find", sql)
             values = [id]
             found = db.exec_prepared("my_find", values)
             db.close
             return Property.new(found[0])
    end

    def Property.find_by_address(address)
      db = PG.connect({ dbname: 'properties', host: 'localhost' })


      sql = "SELECT * FROM properties
             WHERE address = $1"

             db.prepare("my_find", sql)
             values = [address]
             found = db.exec_prepared("my_find", values)
             db.close
             return Property.new(found[0])
    end













    end #class end
