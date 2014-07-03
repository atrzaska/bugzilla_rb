class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :get_story, only: [:show, :edit, :update, :destroy]

  def new
    @comment = @story.comments.new
  end

  def edit
  end

  def create
    @comment = @story.comments.new(comment_params)

    if @comment.save
      create_activity :new
      redirect_to edit_project_story_url(@project, @story), notice: 'Comment was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @comment.update(comment_params)
      create_activity :update
      redirect_to edit_project_story_url(@project, @story), notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    create_activity :destroy
    @comment.destroy
    redirect_to  edit_project_story_url(@project, @story)
  end

  private
  def create_activity(action)
    @comment.create_activity action, owner: current_user, recipient: @project
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def get_story
    @story = @comment.story
    @project = @story.project
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def validate_resource_access
    raise("not authorized") unless @project.in? current_user.projects
  end
end
