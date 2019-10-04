class Task < ApplicationRecord

  belongs_to :user  
  validates :name,    length: { in: 1..140 } 
  validates :startdate,:name,:details,:status,:priority,:enddate,presence: true
  enum priority: [:low, :medium, :high]

  # validate :startdate_cannot_be_later_than_enddate
  # private
  # def startdate_cannot_be_later_than_enddate
  #   if startdate > enddate
  #     errors.add(:startdate, "Can not be set after the end date and time")
  #   end
  # end

  def self.search(term,term1,term2)
    if term
      where('name LIKE ?', "%#{term}%")
    elsif term1
      where('name LIKE ?', "%#{term1}%")
    elsif term2
      where('name LIKE ?', "%#{term2}%")
    else
      order('id desc')
    end
  end

  def self.order_list(sort_order)
    if sort_order == "name"
      order(name: :desc)
    elsif sort_order == "enddate"
      order(enddate: :desc)
    elsif sort_order == "priority"
      order(priority: :desc)
    else
      order(created_at: :desc)
    end
  end

  paginates_per 3
end
