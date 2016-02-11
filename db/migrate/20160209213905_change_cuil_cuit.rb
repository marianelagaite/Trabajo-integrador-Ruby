class ChangeCuilCuit < ActiveRecord::Migration
  def change
  	remove_column :people, :cuil_cuit, :integer
  	add_column :clients, :cuil_cuit, :integer, limit: 8
  end
end
