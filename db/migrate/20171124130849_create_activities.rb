class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.float :apru, limit: 2, null: :no
      t.integer :views, null: :no

      t.timestamps null: false
    end
  end
end
