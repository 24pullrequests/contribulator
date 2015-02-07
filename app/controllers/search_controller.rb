class SearchController < ApplicationController
  def index
    @projects = Project.search(params[:q]).paginate(page: params[:page])
  end
end
