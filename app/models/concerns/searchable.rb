module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def trip_search(query)
        Trip.global_search(query)
    end

    def event_search(query)
        Event.global_search(query)
    end
  end
end