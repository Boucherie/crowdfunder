class SearchesController < ApplicationController
  def search_title
    @projects = Project.where("title ILIKE?", "%#{params[:title]}%")
  end
end
