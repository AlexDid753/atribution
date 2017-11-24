class Medium < ActiveRecord::Base
  has_many :visitors, through: :histories, source: :visitor_id
  has_many :activities, through: :histories, source: :activity_id, class_name:  "activity"
  has_many :histories, foreign_key: "medium_id"
  self.table_name = 'mediums'
end
