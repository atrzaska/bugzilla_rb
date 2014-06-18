class StoriesController < ApplicationController
  before_filter :get_project

  def get_project
    @project = Project.find(params[:project_id])
  end

  def show
    @story = Project.stories.find(params[:id])
  end
end
