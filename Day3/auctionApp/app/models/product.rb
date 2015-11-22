class Product < ActiveRecord::Base
  belongs_to :user

  validates :title, :description, :deadline, presence: true
end
