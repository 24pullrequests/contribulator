class SearchController < ApplicationController
  def index
    @projects = Project.search_by_name_or_owner(search_params).paginate(page: 1)
    @languages = Project.good.languages

    render "projects/index"
  end

  private

  def search_params
    params.fetch(:q, "")
  end
end
