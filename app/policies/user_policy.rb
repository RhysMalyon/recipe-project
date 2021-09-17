class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user
  end

  def update?
    record.user == user # Profile can only be updated by the user.
  end

  private

  def user_is_owner?
    user == record
  end
end
