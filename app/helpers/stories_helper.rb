module StoriesHelper
  def story_actions(story)
    next_links = case story.state
       when 'unstarted'
         [{ status: 'started', color: :default }]
       when 'started'
         [{ status: 'finished', color: :primary }]
       when 'finished'
         [{ status: 'delivered', color: :primary }]
       when 'delivered'
         [{ status: 'accepted', color: :primary }, { status: 'Rejected', color: :primary }]
       when 'rejected'
         [{ status: 'unstarted', color: :primary }]
     end

    links = []

    next_links.each_with_object(links) do |link, obj|
      obj << link_to(link[:status], project_story_path(story.project, story, story: { state: link[:status]}), method: :put, class: "btn btn-#{link[:color]}")
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