class Customer
  include Mongoid::Document
  include Mongoid::Timestamps
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :address, type: String

  has_many :subscriptions

  def add_subscription(subscription)
    self.subscriptions.push(subscription)
  end
end
