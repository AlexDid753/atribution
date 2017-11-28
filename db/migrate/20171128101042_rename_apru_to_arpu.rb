class RenameApruToArpu < ActiveRecord::Migration
  def change
    rename_column :activities, :apru, :arpu
  end
end
