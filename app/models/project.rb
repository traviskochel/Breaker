class Project < ActiveRecord::Base
  belongs_to :user
  has_many :groups
  has_many :deployments
  has_many :scenarios, through: :groups
end
