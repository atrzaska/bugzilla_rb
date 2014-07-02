module StoriesHelper
  def story_actions(story)
    links = []
      case story.state
        when 'unstarted'
         links << link_to('Started', project_story_path(story.project, story, story: { state: 'started'}), method: :put, class: 'btn btn-default')
        when 'started'
          links << link_to('Finished', project_story_path(story.project, story, story: { state: 'finished'}), method: :put, class: 'btn btn-primary')
        when 'finished'
          links << link_to('Delivered', project_story_path(story.project, story, story: { state: 'delivered'}), method: :put, class: 'btn btn-warning')
        when 'delivered'
          links << link_to('Accepted', project_story_path(story.project, story, story: { state: 'accepted'}), method: :put, class: 'btn btn-success')
          links << link_to('Rejected', project_story_path(story.project, story, story: { state: 'rejected'}), method: :put, class: 'btn btn-danger')
        when 'rejected'
          links << link_to('Unstarted', project_story_path(story.project, story, story: { state: 'unstarted'}), method: :put, class: 'btn btn-danger')
      end
    links << link_to('x', project_story_path(story.project, story), method: :delete, class: 'btn btn-danger', data: { confirm: "Are you sure to delete #{story.name}?" })
    links.join('').html_safe
  end

  def get_registered_members(project)
    members = []

    project.members.each do |member|
      if member.user.present?
        members << member
      end
    end

    members
  end
end