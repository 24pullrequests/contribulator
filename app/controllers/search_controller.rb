class SearchController < ApplicationController
  def index
    @projects = Project
                .search(params[:q])
                .for_language(params[:main_language])
                .paginate(page: params[:page])
  end
end
