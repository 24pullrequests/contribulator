class ProjectsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create]

  def index
    scope = Project.order('score desc, last_scored desc').good
    scope = scope.where('lower(main_language) = lower(?)', params[:language]) if params[:language].present?
    @projects = scope.all.paginate(page: params[:page])
    @languages = Project.good.languages
  end

  def show
    if params[:id].present?
      @project = Project.find(params[:id])
    else
      @project = Project.find_by_owner_and_name!(params[:user], params[:repo])
    end

    @issues = @project.issues || nil
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
