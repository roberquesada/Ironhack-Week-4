class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueless: true
end
