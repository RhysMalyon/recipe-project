class BookmarksController < ApplicationController
  # Don't forget to authorize @bookmark as per pundit
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @bookmark = Bookmark.new
    authorize @recipe
  end

  def create

  end

  def destroy

  end
end
