class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :deployment
  belongs_to :scenario

end
