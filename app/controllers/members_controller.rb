class MembersController < ApplicationController
  before_action :get_project, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    @members = @project.members
  end

  def new
    @member = @project.members.new
  end

  def edit
  end

  def create
    @member = @project.members.new(member_params)

    if @member.save
      MemberMailer.send_activation_instructions(@member).deliver
      create_activity :new
      redirect_to project_members_url(@project), notice: 'Member was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @member.update(member_params)
      create_activity :update
      redirect_to project_members_url(@project), notice: 'Member was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    create_activity :destroy
    @member.destroy
    redirect_to project_members_url
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

  def member_params
    params.require(:member).permit(:name, :email, :owner)
  end
end