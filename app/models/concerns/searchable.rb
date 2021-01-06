module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def search(query)
        self.global_search(query)
    end
  end
end