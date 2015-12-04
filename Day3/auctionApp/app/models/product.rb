class Product < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates :title, :description, :deadline, :min_bid, presence: true

  def get_all_bids
    bids.all
  end

  def highest_bid
    bids.order('amount DESC').first
  end

  def is_deadline_reached?
    DateTime.now > deadline
  end

end
