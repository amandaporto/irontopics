class Topic < ActiveRecord::Base
  validates :title, presence: true
  validates :focus_area, presence: true
  validates :description, presence: true

end
