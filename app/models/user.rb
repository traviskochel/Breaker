class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :groups
  has_many :scenarios
  has_many :deployments
  has_many :tasks

  def admin?
    self.admin
  end

  def name
    self.first_name + ' ' + self.last_name
  end
end
