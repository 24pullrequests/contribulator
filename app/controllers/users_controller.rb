class UsersController < ApplicationController
  def show
    @user = params[:user]
    @projects = Project.where(owner: params[:user]).order('score desc')
  end
end
