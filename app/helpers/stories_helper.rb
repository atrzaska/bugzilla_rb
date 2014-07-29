module StoriesHelper
  def story_actions(story)
    links = case story.state
              when 'unstarted'
               [{ status: 'started', color: :default }]
              when 'started'
               [{ status: 'finished', color: :primary }]
              when 'finished'
               [{ status: 'delivered', color: :warning }]
              when 'delivered'
               [{ status: 'accepted', color: :success }, { status: 'rejected', color: :danger }]
              when 'rejected'
               [{ status: 'unstarted', color: :default }]
              else []
     end

    out = []

    links.each_with_object(out) do |link, obj|
      obj << link_to(link[:status], project_story_path(story.project, story, story: { state: link[:status]}), method: :put, class: "btn btn-#{link[:color]}")
    end

    out << link_to('x', project_story_path(story.project, story), method: :delete, class: 'btn btn-danger', data: { confirm: "Are you sure to delete #{story.name}?" })
    out.join('').html_safe
  end

  def get_registered_members(project)
    members = []

    project.members.each do |member|
      members << member if member.user.present?
    end

    members
  end
end