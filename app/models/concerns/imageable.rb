module Imageable
  extend ActiveSupport::Concern

  module ClassMethods
    def background_image
        id = self.pluck(:id)
        self.find(id.sample).photo.key
    end
  end
end