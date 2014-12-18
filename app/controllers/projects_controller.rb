class ProjectsController < ApplicationController
  def index
    @projects = Project.order('score desc')
  end

  def show
    @project = Project.find(params[:id])
  end
end
