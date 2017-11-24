class Medium < ActiveRecord::Base

  has_many :visitors
  has_many :activities
  self.table_name = 'mediums'
end
