class StoriesController < ApplicationController
  before_action :get_project
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @story = @project.stories.new
  end

  def edit
  end

  def create
    @story = @project.stories.new(story_params)

    if @story.save
      redirect_to [@project, @story], notice: 'Story was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @story.update(story_params)
      redirect_to current_project_stories_url(@project), notice: 'Story was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @story.destroy
    redirect_to  current_project_stories_url(@project)
  end

  def current
    @stories = @project.stories.current
  end

  def icebox
    @stories = @project.stories.icebox
  end

  def done
    @stories = @project.stories.done
  end

  def backlog
    @stories = @project.stories.backlog
  end

private
  def get_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_story
    @story = @project.stories.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:name, :state, :description, :story_type, :container)
  end
end
