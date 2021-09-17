class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user # Any user can bookmark a recipe.
  end

  def destroy?
    record.user == user # Only the bookmark's author can remove it.
  end
end
