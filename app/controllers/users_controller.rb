class UsersController < ApplicationController
  def show
    @user = params[:user]
    @projects = Project.where('lower(owner) = lower(?)', params[:user]).order('score desc, last_scored desc')
  end
end
