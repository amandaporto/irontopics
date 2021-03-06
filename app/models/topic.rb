class Topic < ActiveRecord::Base
  validates :title, presence: true
  validates :focus_area, presence: true
  validates :description, presence: true

  has_many :interests
end
