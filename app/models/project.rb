class Project < ActiveRecord::Base
  include PublicActivity::Common

  has_many :stories
  has_many :members
  has_many :users, through: :members
end