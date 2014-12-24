class ProjectsController < ApplicationController
  def index
    @projects = Project.order('score desc')
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    Project.create_from_github_url(params[:project][:github_url])
    redirect_to root_path
  end
end
