module ProjectsHelper
  def get_recent_activities(project)
    PublicActivity::Activity.order("created_at desc").where(recipient: project).limit(3)
  end
end