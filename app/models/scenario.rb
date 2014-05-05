class Scenario < ActiveRecord::Base
  belongs_to :group
  belongs_to :project
  belongs_to :user
  has_many :steps
  has_many :assumptions
  has_many :tasks

  accepts_nested_attributes_for :steps, :reject_if => proc { |a| a['instruction'].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :assumptions, :reject_if => proc { |a| a['instruction'].blank? }, :allow_destroy => true


  def sync_deployments
    self.group.project.open_deployments.each do |deployment|
      deployment.add_task(self)
    end
  end
end
