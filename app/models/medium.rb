class Medium < ActiveRecord::Base
  include ActionView::Helpers
  has_many :visitors, through: :histories
  has_many :activities, through: :histories
  has_many :histories, foreign_key: "medium_id"
  self.table_name = 'mediums'

  def activities_proceeds
    summ ||= 0
    medium_activity_ids = "SELECT activity_id FROM histories WHERE  medium_id = :medium_id"
    medium_activities = activities.where("activity_id IN (#{medium_activity_ids})", medium_id:id)
    medium_activities.each do |medium_activity|
      summ += medium_activity.apru
    end
    return summ.round
  end
end
