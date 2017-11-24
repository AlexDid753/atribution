class RemoveViewsFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :views, :integer
  end
end
