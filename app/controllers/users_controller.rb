class UsersController < ApplicationController
  def show
    @user = User.find_by_nickname(params[:user])
    if @user
      @projects = Project.where('lower(owner) = lower(?)', params[:user]).order('score desc, last_scored desc')
    else
      redirect_to '/'
    end
  end
end
