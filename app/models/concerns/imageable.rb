module Imageable
  extend ActiveSupport::Concern

  module ClassMethods
    def background_image
        id = self.pluck(:id)
        if self.find(id.sample).photo.key
          self.find(id.sample).photo.key
        else
          'california.jpg'
        end
    end
  end
end