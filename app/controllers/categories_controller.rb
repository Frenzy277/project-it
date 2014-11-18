class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :create]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit!)

    if @category.save
      flash[:success] = "Successfully created a new category"
      redirect_to root_url
    else
      render :new
    end
  end
end