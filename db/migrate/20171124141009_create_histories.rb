class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :visitor_id
      t.integer :medium_id
      t.integer :activity_id

      t.timestamps null: false
    end
    add_index :histories, :visitor_id
    add_index :histories, :medium_id
  end
end
