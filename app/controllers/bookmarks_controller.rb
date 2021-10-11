class BookmarksController < ApplicationController
  before_action :set_recipe, only: :destroy
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @bookmark = Bookmark.new
    authorize @recipe
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @recipe = Recipe.find(params[:recipe_id])
    @bookmark.recipe = @recipe
    @bookmark.user = current_user
    authorize @bookmark
    if @bookmark.save
      redirect_to :back, notice: 'Review was successfully bookmarked.'
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @bookmark.destroy
    redirect_to :back, notice: 'Recipe removed from bookmarks.'
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def bookmark_params
    params.require(:bookmark).permit(:name, :prep_time, :instructions, :rating, ingredients: [])
  end
end
