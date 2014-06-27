class Task < ActiveRecord::Base
  belongs_to :story, counter_cache: true
end