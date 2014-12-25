class ProjectsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create]

  def index
    @projects = Project.order('score desc').where('score >= ?', Project::MINIMUM_SCORE)
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
