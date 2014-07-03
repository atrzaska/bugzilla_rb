class Task < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :story, counter_cache: true

  validates :text, presence: true
end