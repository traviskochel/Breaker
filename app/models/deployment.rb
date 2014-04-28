class Deployment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :tasks

  scope :completed, -> {where(completed: true).order('created_at DESC')}
  scope :current, -> {where(completed: [false, nil]).order('created_at DESC')}

end
