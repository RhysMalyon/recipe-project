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
    user == record.user # Only the creator can update the recipe.
  end

  # private

  # def user_is_owner?
  #   user == record
  # end

end
