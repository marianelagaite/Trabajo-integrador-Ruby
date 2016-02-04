class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.datetime :birthday
      t.integer :gender, limit: 1
      t.integer :dni, limit: 8
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
