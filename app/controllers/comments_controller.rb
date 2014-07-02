class CommentsController < ApplicationController
  before_action :get_story, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    @comments = @story.comments
  end

  def new
    @comment = @story.comments.new
  end

  def edit
  end

  def create
    @comment = @story.comments.new(comment_params)

    if @comment.save
      create_activity :new
      redirect_to project_members_url(@project), notice: 'Comment was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @comment.update(comment_params)
      create_activity :update
      redirect_to edit_project_story_path(@story.project), notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @comment.destroy
    create_activity :destroy
    redirect_to edit_project_story_path(@story.project)
  end

  def confirm
    member = Member.find_by_token(params[:token])
    member.update(confirmed: true)
    create_activity :confirm

    user = User.find_by_email(member.email)

    if user.present?
      member.update(user: user)
    end

    if user != current_user
      sign_out_and_redirect(project_url(member.project)) and return
    end

    redirect_to project_url(member.project)
  end

  private
  def create_activity(action)
    @member.create_activity action, owner: current_user, recipient: @project
  end

  def get_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_member
    @member = @project.members.find(params[:id])
  end

  def comment_params
    params.require(:member).permit(:name, :email, :owner)
  end
end