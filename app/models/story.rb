class Story < ActiveRecord::Base
  belongs_to :project
  has_many :tasks
  has_many :comments
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  scope :current, -> {where(state: %w'started finished delivered rejected')}
  scope :icebox, -> {where(state: 'unstarted', container: 'icebox')}
  scope :backlog, -> {where(state: 'unstarted', container: 'backlog')}
  scope :done, -> {where(state: 'accepted')}
end