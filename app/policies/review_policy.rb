class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user # Any user can see what review another user has written.
  end

  def create?
    user # Any user can write a review.
  end

  def show?
    index?
  end

  def update?
    record.user == user # Only the review's author can edit their review.
  end

  def destroy?
    update? # Whoever can edit can also destroy the review.
  end
end
