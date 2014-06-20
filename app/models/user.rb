class User < ActiveRecord::Base
  has_many :members
  has_many :projects, through: :members

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
