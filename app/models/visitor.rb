class Visitor < ActiveRecord::Base
  has_many :mediums, through: :histories, source: :medium_id
  has_many :activities, through: :histories, source: :activity_id, class_name:  "activity"
  has_many :histories, class_name:  "history",
           foreign_key: "visitor_id"
end
