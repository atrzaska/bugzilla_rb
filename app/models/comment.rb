class Comment < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :story, counter_cache: true
end