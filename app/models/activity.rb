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

  def medium_id(who_win = first)
    if who_win == 'first'
      find_histories.first.medium_id.to_s
    elsif who_win == 'last'
      find_histories.last.medium_id.to_s
    end
  end

  def medium_title(who_win = first)
    if who_win == 'first'
      mediums.find_by(id: find_histories.first.medium_id.to_s).title
    elsif who_win == 'last'
      mediums.find_by(id: find_histories.last.medium_id.to_s).title
    else
      'Все каналы'
    end
  end

  def mediums_count(who_win = first)
    if who_win == 'linear'
      History.where(activity_id: id).count
    else
      History.where(medium_id: medium_id(who_win), activity_id: id).count
    end
  end

  def mediums_proceed(who_win = first)
    (arpu * mediums_count(who_win)).round || 0
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
      # search_arr = search.split('|')
      # search_arr.each do |search_item|
      #   where('title LIKE ?', "%#{search_item}%")
      # end
      #where('title LIKE ?', "%#{search}%")
      #joins(:mediums).where {( medium.title =~ "%#{search}%")}
    else
      all
    end
  end

  def self.search_by_medium(search)
    if search
      joins(:mediums).where(mediums: {title: search})
    else
      all
    end
  end
end

