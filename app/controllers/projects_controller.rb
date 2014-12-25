class ProjectsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create]

  def index
    scope = Project.order('score desc').good
    scope = scope.where(main_language: params[:language]) if params[:language].present?
    @projects = scope.all
    @languages = Project.good.languages
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
