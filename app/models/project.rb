class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :title, :description, :goal, :start_date, :end_date, presence: true
<<<<<<< HEAD

  #validates :goal, numericality: {greater_than_or_equal_to: 0 }
=======
  validates :owner, presence: true
>>>>>>> e2c8c05c95ab701f827c6464de6173b7664e4ca1
end
