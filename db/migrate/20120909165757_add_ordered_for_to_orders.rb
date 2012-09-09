class AddOrderedForToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ordered_for, :string
  end
end
