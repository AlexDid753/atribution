class AddLogsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :logs, :text
  end
end
