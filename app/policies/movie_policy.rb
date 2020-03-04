class MoviePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # user = User.find_by(authentication_token: record.user.authentication_token)
    record.user == user
  end

  def create?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
