class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :get_story, only: [:show, :edit, :update, :destroy]
  before_action :get_story_create, only: [:new, :create]

  def new
    @task = @story.tasks.new
  end

  def edit
  end

  def create
    @task = @story.tasks.new(task_params)

    if @task.save
      create_activity :new
      redirect_to edit_project_story_url(@project, @story), notice: 'Task was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @task.update(task_params)
      create_activity :update
      redirect_to edit_project_story_url(@project, @story), notice: 'Task was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    create_activity :destroy
    @task.destroy
    redirect_to  edit_project_story_url(@project, @story)
  end

  private
  def create_activity(action)
    @task.create_activity action, owner: current_user, recipient: @project
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def get_story
    @story = @task.story
    @project = @story.project
  end

  def get_story_create
    @story = Story.find session[:current_story_id]
    @project = @story.project
  end

  def task_params
    params.require(:task).permit(:text, :complete)
  end

  def validate_resource_access
    raise("not authorized") unless @project.in? current_user.projects
  end
end
