class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :client, index: true, foreign_key: true
      t.references :purchaser, index: true, foreign_key: true
      t.decimal :amount, precision: 16, scale: 3
      t.string :description
      t.datetime :date

      t.timestamps null: false
    end
  end
end
