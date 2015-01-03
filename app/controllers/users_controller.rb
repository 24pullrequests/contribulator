class UsersController < ApplicationController
  def show
    @projects = Project.where(owner: params[:user]).order('score desc')
  end
end
