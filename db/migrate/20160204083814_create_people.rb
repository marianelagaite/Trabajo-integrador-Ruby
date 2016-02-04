class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :cuil_cuit, limit: 8
      t.integer :type_person, limit: 1
      t.integer :trash, limit: 1

      t.timestamps null: false
    end
  end
end
