class ProjectsController < ApplicationController
  rescue_from Octokit::NotFound do
    flash[:warning] = "This repository does not exist."
    redirect_to(:back)
  end

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
      @project = Project.find_by_owner_and_name(params[:user], params[:repo])
    end

    if @project.nil?
      @project = Project.create(owner: params[:user], name: params[:repo])
    end

    @issues = @project.issues.limit(5) || nil
  end

  def new
    @project = Project.new
  end

  def create
    github_project = GithubProject.new(github_url)

    unless github_project.valid_url?
      redirect_to project_search_path(q: github_url)
    end

    project = github_project.find

    if project.present?
      flash[:info] = "#{project.owner}/#{project.name} has already been added."
    else
      project = github_project.create
    end

      redirect_to project_direct_path(user: project.owner, repo: project.name)
  end

  private

  def github_url
    params[:project][:github_url]
  end
end
