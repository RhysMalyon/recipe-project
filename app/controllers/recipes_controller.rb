class RecipesController < ApplicationController
  # Don't forget to authorize @recipe as per pundit
  before_action :set_recipe, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @user = current_user
    @recipes = policy_scope(Recipe)
  end

  def show; end

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    authorize @recipe
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @user = current_user
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: 'Your recipe has been updated.'
    else
      render :edit
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def recipe_params
    params.require(:recipe).permit(:name, :prep_time, :instructions, :rating, ingredients: [])
  end
end
