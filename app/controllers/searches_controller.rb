class SearchesController < ApplicationController
  def search_title
    @projects = Project.where("title LIKE?", "%#{params[:title]}%")
  end
end
