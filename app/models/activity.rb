class Activity < ActiveRecord::Base
  has_many :visitors, through: :histories
  has_many :mediums, through: :histories
  has_many :histories, foreign_key: 'activity_id'

  def proceeds
    (apru * visitors.count).round
  end

  def apru_round
    apru.round
  end

  def find_mediums
    histories.where(activity_id: id)
  end

  def medium_title
    mediums.find_by(find_mediums.first.medium_id).title
    # case who_win
    #   when 1
    #     mediums.find_by(find_mediums.first.medium_id).title
    #   when 2
    #     mediums.find_by(find_mediums.last.medium_id).title
    #   when 3
        #mediums.find_by(find_mediums.last.medium_id).title
    # end
  end

  def mediums_count(who_win = 1)
    if (who_win.nil?)
      who_win = 1
    end

    case who_win
      when 1
        History.where(medium_id: find_mediums.first.medium_id, activity_id: id).count
      when 2
        History.where(medium_id: find_mediums.last.medium_id, activity_id: id).count
      else
        #History.where(medium_id: find_mediums.first.medium_id, activity_id: id).count
    end

  end

  def mediums_proceed
    (apru * mediums_count).round
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
