class Tea
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :temperature, type: Integer
  field :brew_time, type: Integer
end
