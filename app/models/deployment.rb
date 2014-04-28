class Deployment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :tasks
  
  accepts_nested_attributes_for :tasks, :allow_destroy => true

  scope :completed, -> {where(completed: true).order('created_at DESC')}
  scope :current, -> {where(completed: [false, nil]).order('created_at DESC')}

end
