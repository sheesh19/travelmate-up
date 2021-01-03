class EventRegistrationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def create?
    true
  end

  def update?
    record.event.trip.user == user || record.user == user
  end

  def destroy?
    record.user == user
  end
end
