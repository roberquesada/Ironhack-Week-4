class Project < ActiveRecord::Base
  has_many :entries
  has_many :people, through: :participations
  has_many :participations

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: {maximum: 30}
  validates :name, format: {with: /(^[A-Za-z0-9\s]*$)/}

  def self.iron_find(params)
    where(id: params)
  end

  def self.clean_old()
    where('created_at < ?', 1.week.ago).destroy_all
  end

  def self.last_created_projects(max)
    order('created_at DESC').limit(max)
  end

  def self.first_updated_projects(max)
    order('updated_at ASC').limit(max)
  end

  def total_hours_in_month(month, year)
    #Calcule which entries have date  > 1st month and date < 31th of month
    date_init = Time.new(year, month, 1)
    date_end = date_init.end_of_month
    query = entries.where(updated_at: date_init..date_end)

    #Sum the hours of those entries
    query.reduce(0) do |sum,entry|
      sum += (entry.minutes / 60.0) + entry.hours
    end

  end
end
