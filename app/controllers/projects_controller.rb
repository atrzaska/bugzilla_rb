class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  after_action :add_me_to_project, only: :create

  def index
    @projects = current_user.projects.where('members.confirmed is true').page(params[:page]).per(8)

    # @projects = Project.find.page(params[:page]).per(Bugzilla::Application::ITEMS_PER_PAGE)
  end

  def show
    redirect_to current_project_stories_path(@project)
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = current_user.projects.new(project_params)


    if @project.save
      redirect_to current_project_stories_url(@project), notice: 'Project was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to current_project_stories_url(@project), notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to current_project_stories_url(@project)
  end

private
  def add_me_to_project
    member = Member.new
    member.email = current_user.email
    member.name = 'Me'
    member.owner = true
    member.confirmed = true
    member.user = current_user
    member.project = @project
    member.save
  end

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
