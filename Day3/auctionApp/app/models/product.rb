class Product < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates :title, :description, :deadline, presence: true
end
