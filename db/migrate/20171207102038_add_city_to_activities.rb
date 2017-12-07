class AddCityToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :city, :string
  end
end
