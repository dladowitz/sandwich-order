class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :description
      t.string :ordered_by

      t.timestamps
    end
  end
end
