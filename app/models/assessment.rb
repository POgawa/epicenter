class Assessment < ActiveRecord::Base
  validates_presence_of :title, :section, :url

  has_many :requirements
  has_many :submissions

  def has_been_submitted_by(user)
    submissions.exists?(user: user)
  end
end
