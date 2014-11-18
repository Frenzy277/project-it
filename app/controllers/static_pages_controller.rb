class StaticPagesController < ApplicationController
  def home
    @projects = Project.favorite_projects

    respond_to do |format|
      format.html
      format.js
    end
  end
end