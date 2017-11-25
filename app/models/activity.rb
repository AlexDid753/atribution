class Activity < ActiveRecord::Base
  has_many :visitors, through: :histories
  has_many :mediums, through: :histories, source: :medium_id
  has_many :histories, foreign_key: "activity_id"

  def proceeds
    (apru * visitors.count).round
  end

  def apru_round
    apru.round
  end
end
