class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String  # Basic, Primo, ProPlus+
  field :price, type: Float  # 20.00, 30.00, 40.00
  field :status, type: String  # active, inactive, expired, canceled
  field :frequency, type: Integer  # 15, 30, 60, 90
  field :tea_ids, type: Array, default: []

  validates_presence_of :title, :price, :status, :frequency

  embedded_in :customer

  def teas
    Tea.find(tea_ids)
  end
end
