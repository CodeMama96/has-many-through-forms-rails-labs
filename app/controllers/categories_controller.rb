class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def create
    @category = Category.find(params[:id])
    @category.post = Post.find_or_create_by(post_params)

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end


  private
  def category_params
    params.require(:category).premit(:name)
  end

  def post_params
    params.require(:post).permit(:title)
  end

end
