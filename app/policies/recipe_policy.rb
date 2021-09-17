class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user # Any user can create a recipe.
  end

  def index?
    true # Anyone can see the recipes
  end

  def show?
    index? # Anyone can see individual recipes
  end

  def update?
    record.user == user # Only the creator can update the recipe.
  end
end
