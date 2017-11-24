class History < ActiveRecord::Base
  belongs_to  :visitor
  belongs_to :activity
  belongs_to :medium
end
