class CreateMedia < ActiveRecord::Migration
  def change
    create_table :mediums do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
