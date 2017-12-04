class AddVisitorsCountToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :visitors_count, :integer, default: 0
  end
end
