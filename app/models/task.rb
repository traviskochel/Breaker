class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :deployment
  belongs_to :scenario

  scope :completed, -> {where(completed: true).order('created_at DESC')}

  scope :current, -> {where(completed: [false, nil]).order('created_at DESC')}

end
