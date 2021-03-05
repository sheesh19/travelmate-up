class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def edit?
    record.trip.user == user
  end
  
  def update?
    record.trip.user == user
  end
  
  def destroy?
    record.trip.user == user
  end
end
