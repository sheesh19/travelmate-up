class EventRegistrationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user) + scope.includes(event: :trip).where(trips: { user_id: user })
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
