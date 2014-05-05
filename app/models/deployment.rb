class Deployment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :tasks
  
  accepts_nested_attributes_for :tasks, :allow_destroy => true

  def check_for_completeness
    if self.tasks.count == self.tasks.where(completed: true).count
      self.completed = true
      self.save

    elsif self.completed == true
      self.completed = false
      self.save
    end
  end

end
