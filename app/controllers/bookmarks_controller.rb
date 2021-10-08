class BookmarksController < ApplicationController
  # Don't forget to authorize @bookmark as per pundit
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
end
