class Activity < ActiveRecord::Base
  has_many :visitors, through: :histories
  has_many :mediums, through: :histories
  has_many :histories, foreign_key: 'activity_id'

  def proceeds
    (arpu * visitors.count).round
  end

  def find_histories
    histories.where(activity_id: id)
  end

  def first_medium_id
    find_histories.first.medium_id.to_s
  end

  def last_medium_id
    find_histories.last.medium_id.to_s
  end

  def first_medium_title
    mediums.find_by(id: find_histories.first.medium_id.to_s).title
  end

  def last_medium_title
    mediums.find_by(id: find_histories.last.medium_id.to_s).title
  end

  def first_mediums_count
    History.where(medium_id: first_medium_id, activity_id: id).count
  end

  def last_mediums_count
    History.where(medium_id: last_medium_id, activity_id: id).count
  end

  def first_mediums_proceed
    (arpu * first_mediums_count).round
  end

  def last_mediums_proceed
    (arpu * last_mediums_count).round
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
