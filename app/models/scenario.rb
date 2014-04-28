class Scenario < ActiveRecord::Base
  belongs_to :group
  belongs_to :project
  has_many :steps
  has_many :prereqs

  accepts_nested_attributes_for :steps
  accepts_nested_attributes_for :prereqs
end
