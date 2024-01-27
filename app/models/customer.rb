class Customer
  include Mongoid::Document
  include Mongoid::Timestamps
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :address, type: String
  field :subscriptions, type: Array

  validates_presence_of :first_name, :last_name, :email, :address

  has_many :subscriptions

  def add_subscription(subscription)
    # require 'pry'; binding.pry
    self.subscriptions.push(Subscription.create(subscription))
  end
end
