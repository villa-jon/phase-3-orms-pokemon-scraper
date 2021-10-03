class Pokemon
	attr_accessor :id, :type, :name, :db

	def initialize( id:, type:, name:, db:)
		@id, @type, @name, @db = id, type, name, db
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end 

	def self.find(id_num, db)
		ash_pokedex = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
		Pokemon.new(id: ash_pokedex[0], name: ash_pokedex[1], type: ash_pokedex[2], db: db)
	end 

end
