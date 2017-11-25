class Visitor < ActiveRecord::Base
  has_many :mediums, through: :histories
  has_many :activities, through: :histories
  has_many :histories, foreign_key: 'visitor_id'

  def visit_activity(medium, activity)
    histories.create!(medium_id: medium.id, activity_id: activity.id)
  end
end
