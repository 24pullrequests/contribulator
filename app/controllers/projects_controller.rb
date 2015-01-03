class ProjectsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create]

  def index
    scope = Project.order('score desc').good
    scope = scope.where(main_language: params[:language]) if params[:language].present?
    @projects = scope.all.paginate(:page => params[:page], :per_page => 20)
    @languages = Project.good.languages
  end

  def show
    @project = Project.find(params[:id]) if params[:id]
    @project = Project.user_repo(params[:user], params[:repo]).first if params[:user] and params[:repo]
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.find_from_github_url(params[:project][:github_url])
    flash[:info] = "#{project.owner}/#{project.name} has already been added." unless project.nil?
    project = Project.create_from_github_url(params[:project][:github_url]) if project.nil?

    redirect_to project_direct_path(user: project.owner, repo: project.name)
  end
end
