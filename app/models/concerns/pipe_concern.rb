module PipeConcern
  extend ActiveSupport::Concern
  included do
    has_many :to_pipes, as: :to, class_name: "Pipe"
    has_many :from_pipes, as: :from, class_name: "Pipe"
  end
end