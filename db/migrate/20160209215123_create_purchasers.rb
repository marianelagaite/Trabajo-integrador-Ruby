class CreatePurchasers < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.references :person, index: true, foreign_key: true
      t.integer :cuil_cuit, limit: 8

      t.timestamps null: false
    end
  end
end
