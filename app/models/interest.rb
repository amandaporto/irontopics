class Interest < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic, counter_cache: true

  validates :level, inclusion: [1,2,3,4,5]
end
