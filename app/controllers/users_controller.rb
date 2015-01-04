class UsersController < ApplicationController
  def show
    @user = params[:user]
    @projects = Project.where(owner: params[:user]).order('score desc, last_scored desc')
  end
end
