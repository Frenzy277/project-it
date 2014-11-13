class StaticPagesController < ApplicationController
  def home
    @projects = Project.all

    respond_to do |format|
      format.html
      format.js
    end
  end
end