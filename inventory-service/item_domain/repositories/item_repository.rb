class ItemRepository
  attr_reader :relation, :db

  def initialize(db: DB, relation: DB[:items])
    @db = db
    @relation = relation
  end

  def all
    relation.to_a
  end

  def create(name:, price:)
    db.transaction do
      id = relation.insert(name: name, price: price)
      relation[id: id]
    end
  end

  def toggle_status(id)
    db.transaction do
      item = relation[id: id]
      relation.where(id: item[:id]).update(active: !item[:active])
    end
  end
end
