class Entry < ActiveRecord::Base
  belongs_to :project

  validates :minutes, :hours, numericality: {only_integer: true}
  validates :minutes, :hours, :date, :project_id, presence: true
end
