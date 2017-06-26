class SearchesController < ApplicationController
  def search_title
    # @project = Project.find_by(:title => params[:title])
    @projects = Project.where("title LIKE?", "%#{params[:title]}%")
  end
end
