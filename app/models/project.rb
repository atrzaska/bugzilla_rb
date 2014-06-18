class Project < ActiveRecord::Base
  has_many :stories
  has_and_belongs_to_many :members
end