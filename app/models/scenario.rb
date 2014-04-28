class Scenario < ActiveRecord::Base
  belongs_to :group
  belongs_to :project
  has_many :steps
  has_many :assumptions

  accepts_nested_attributes_for :steps, :reject_if => proc { |a| a['instruction'].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :assumptions, :reject_if => proc { |a| a['instruction'].blank? }, :allow_destroy => true
end
