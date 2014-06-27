module StoriesHelper
  def next_button_name(story)
    next_name = case story.state
              when 'unstarted'
                'Started'
              when 'started'
                'Finished'
              when 'finished'
                'Delivered'
              when 'delivered'
                %w'Accepted Rejected'
              when 'rejected'
                'Unstarted'
            end
  end

  def next_story_state(story)
    next_state = case story.state
             when 'unstarted'
               'started'
             when 'started'
               'finished'
             when 'finished'
               'delivered'
             when 'delivered'
                %w'accepted rejected'
             when 'rejected'
               'unstarted'
           end
  end

  def next_button_class(story)
    next_class = case story.state
                    when 'unstarted'
                      'btn btn-default'
                    when 'started'
                      'btn btn-primary'
                    when 'finished'
                      'btn btn-warning'
                    when 'delivered'
                      ['btn btn-success', 'btn btn-danger']
                    when 'rejected'
                      'btn btn-default'
                  end
  end
end