class ReviewsController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @user = current_user
    @reviews = policy_scope(Review)
  end

  def show; end

  def new
    @recipe = Recipe.new
    authorize @review
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to recipe_path(@recipe), notice: 'Review was successfully added.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @user = current_user
    if @review.update(review_params)
      redirect_to recipe_path(@recipe), notice: 'Your review has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @user = current_user
    authorize @review
    @review.destroy
    redirect_to recipe_path(@recipe), notice: 'Your review was successfully removed'
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
