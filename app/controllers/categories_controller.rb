class CategoriesController < ApplicationController

  before_action :require_admin
  
  def new
    @category = Category.new   
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save(category_params)
      flash[:notice] = "Category Saved"
      redirect_to root_path
    else
      render :new    
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = "Category Update"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit!
  end
end