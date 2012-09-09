class RemoveOrderedByFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :ordered_by
  end

  def down
    add_column :orders, :ordered_by, :string
  end
end
