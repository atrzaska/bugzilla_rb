class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :check_logged_in

  def index

  end

  def check_logged_in
    if user_signed_in?
      redirect_to projects_path
    else
      render :index
    end
  end
end