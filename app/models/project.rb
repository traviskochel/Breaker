class Project < ActiveRecord::Base
  belongs_to :user
  has_many :groups
  has_many :scenarios, through: :groups
end
