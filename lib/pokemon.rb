class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end
    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end
    def self.find(id_num, db)
        pokemon_finder = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
        Pokemon.new(id: pokemon_finder[0], name: pokemon_finder[1], type: pokemon_finder[2], db: db)
    end
end
