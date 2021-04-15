require 'sequel'

DB = Sequel.sqlite # memory database, requires sqlite3

DB.create_table :items do
  primary_key :id
  String :name, null: false
  Integer :price, null: false
  TrueClass :active, default: true
end

