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

  def add_task(scenario)
    task = self.tasks.build
    task.scenario_id = scenario.id
    task.group_id = scenario.group_id
    task.user = self.user
    task.save
  end

  def build_tasks
    self.project.scenarios.each do |scenario|
      self.add_task(scenario)
    end
  end

end
