class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validate :test


  def test
    if self.user == project.owner
      errors.add(:user,'You cannot back your own project')
    end
  end
end
