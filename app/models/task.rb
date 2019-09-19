class Task < ApplicationRecord
    
  validates :name,    length: { in: 1..140 } 
  validates :startdate,:name,:details,:status,:priority,:enddate,presence: true

  # validate :startdate_cannot_be_later_than_enddate
  # private
  # def startdate_cannot_be_later_than_enddate
  #   if startdate > enddate
  #     errors.add(:startdate, "Can not be set after the end date and time")
  #   end
  # end

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      order('id desc')
    end
  end

  def self.order_list(sort_order)
    if sort_order == "name"
      order(name: :desc)
    elsif sort_order == "enddate"
      order(enddate: :desc)
    else
      order(startdate: :desc)
    end
  end
end
