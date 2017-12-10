class CreateEvents < ActiveRecord::Migration
  def change

    create_table :events do |t|
      t.integer :activity_id
      t.datetime :start_time
      t.text :recurring

      t.timestamps null: false
    end
  end
end
