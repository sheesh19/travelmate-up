class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def class_string
    self.class.to_s.downcase
  end
end
