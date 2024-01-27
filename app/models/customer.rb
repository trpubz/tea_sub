class Customer
  include Mongoid::Document
  include Mongoid::Timestamps
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :address, type: String

  validates_presence_of :first_name, :last_name, :email, :address

  embeds_many :subscriptions

  def add_subscription(subscription)
    # require 'pry'; binding.pry
    self.subscriptions.create(subscription)
  end
end
