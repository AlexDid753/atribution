class Activity < ActiveRecord::Base
  has_many :visitors, through: :histories, source: :visitor_id
  has_many :mediums, through: :histories, source: :medium_id
end
