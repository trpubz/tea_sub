class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :price, type: Float
  field :status, type: String
  field :frequency, type: Integer
end
