class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :title, :description, :goal, :start_date, :end_date, presence: true


  validates :goal, numericality: { greater_than_or_equal_to: 0 }

  validates :owner_id, presence: true

  validate :check_start_date
  validate :check_end_date

  def check_start_date
    if start_date < Date.today
      errors.add(:start_date, "-----> Start date must be in future")
    end
  end

  def check_end_date
    if end_date < start_date
      errors.add(:end_date, "----> End date must be after project start date")
    end
  end

end
