class Story < ActiveRecord::Base
  include PublicActivity::Common

  STATES = [ STATE_UNSTARTED = 'unstarted'.freeze,
             STATE_STARTED = 'started'.freeze,
             STATE_FINISHED = 'finished'.freeze,
             STATE_DELIVERED = 'delivered'.freeze,
             STATE_ACCEPTED = 'accepted'.freeze,
             STATE_REJECTED = 'rejected'.freeze].freeze

  STORY_TYPES = [ STORY_TYPE_FEATURE = 'feature'.freeze,
                  STORY_TYPE_BUG = 'bug'.freeze,
                  STORY_TYPE_CHORE = 'chore'.freeze,
                  STORY_TYPE_RELEASE = 'release'.freeze].freeze

  CONTAINTERS = [ CONTAINER_ICEBOX = 'icebox'.freeze,
                  CONTAINTER_BACKLOG = 'backlog'.freeze].freeze

  belongs_to :project
  has_many :tasks
  has_many :comments
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  validates :name, :description, presence: true
  validates :state, inclusion: { in: [STATE_UNSTARTED, STATE_STARTED, STATE_FINISHED, STATE_DELIVERED, STATE_ACCEPTED, STATE_REJECTED]}
  validates :story_type, inclusion: { in: [STORY_TYPE_FEATURE, STORY_TYPE_BUG, STORY_TYPE_CHORE, STORY_TYPE_RELEASE]}
  validates :container, inclusion: { in: [CONTAINER_ICEBOX, CONTAINTER_BACKLOG]}

  scope :current, -> { where(state: [STATE_STARTED STATE_FINISHED STATE_DELIVERED STATE_REJECTED])}
  scope :icebox, -> { where(state: STATE_UNSTARTED, container: CONTAINER_ICEBOX)}
  scope :backlog, -> { where(state: STATE_UNSTARTED, container: CONTAINTER_BACKLOG)}
  scope :done, -> { where(state: STATE_ACCEPTED)}
end