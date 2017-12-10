class Activity < ActiveRecord::Base
  scope :featured, -> {order('visitors_count DESC')}
  has_many :visitors, through: :histories, counter_cache: true
  has_many :mediums, through: :histories
  has_many :histories, foreign_key: 'activity_id'
  has_many :events

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


  def filter(who_win = 'first', search = '')
      if search.present?
        search.split("|").include? (medium_title(who_win))
      else
        true
      end
  end




  def medium_title(who_win = 'first')
      case who_win
        when 'first'
          mediums.find_by(id: find_histories.first.medium_id.to_s).title
        when 'last'
          mediums.find_by(id: find_histories.last.medium_id.to_s).title
        else
          'Все каналы'
      end
  end


# def medium_title(who_win = first, search = '')
#   if search.present?
#     splited = search.split("|").map.with_index.each_with_object({}) { |(i, v), h| h[:"#{i}"] = "%#{v}%" }
#     criteria = splited.keys.map { |key| "mediums.title LIKE \"#{key}\" " }.join(' OR ')
#     mediums.where(criteria).first.title
#   elsif who_win == 'first'
#     mediums.find_by(id: find_histories.first.medium_id.to_s).title
#   elsif who_win == 'last'
#     mediums.find_by(id: find_histories.last.medium_id.to_s).title
#   else
#     'Все каналы'
#   end
#
#   # if search.present?
#   #   splited = search.split("|").map.with_index.each_with_object({}) {|(i, v), h| h[:"#{i}"] = "%#{v}%"}
#   #   criteria = splited.keys.map {|key| "mediums.title LIKE \"#{key}\" "}.join(' OR ')
#   #   if who_win.present?
#   #     case who_win
#   #       when 'first'
#   #         mediums.find_by(id: find_histories.first.medium_id.to_s).title
#   #       when 'last'
#   #         mediums.find_by(id: find_histories.last.medium_id.to_s).title
#   #       else
#   #         'Все каналы'
#   #     end
#   #
#   #   end
#   # end
# end

  def mediums_count(who_win = first, search = '')
    if search.present?
      splited = search.split("|").map.with_index.each_with_object({}) {|(i, v), h| h[:"#{i}"] = "%#{v}%"}
      criteria = splited.keys.map {|key| "mediums.title LIKE \"#{key}\" "}.join(' OR ')
      med_id = mediums.where(criteria).first.id
      History.where("medium_id = :med_id AND activity_id = :activity_id ", med_id: med_id, activity_id: id).count
    elsif who_win == 'linear'
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
      splited = search.split("|").map.with_index.each_with_object({}) {|(i, v), h| h[:"#{i}"] = "%#{v}%"}
      criteria = splited.keys.map {|key| "mediums.title LIKE \"#{key}\" OR activities.title LIKE \"#{key}\""}.join(' OR ')
      joins(:mediums).where(criteria).distinct

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

