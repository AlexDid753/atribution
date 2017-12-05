class AddPriceToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :price, :integer, default: 0
    add_column :activities, :rating, :integer, default: 0
  end
end
