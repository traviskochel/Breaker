class Project < ActiveRecord::Base
  belongs_to :user
  has_many :groups
  has_many :deployments
  has_many :scenarios, through: :groups

  def completed_deployments
    self.deployments.where(completed: true).order('created_at DESC')
  end
  def current_deployments
    self.deployments.where(completed: [false, nil]).order('created_at DESC')
  end
end
