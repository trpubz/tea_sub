require "rails_helper"

RSpec.describe Subscription, type: :model do
  before(:each) do
    DatabaseCleaner.clean
  end

  it { should validate_presence_of :title }
  it { should validate_presence_of :price }
  it { should validate_presence_of :status }
  it { should validate_presence_of :frequency }

  it "should exist without a customer" do
    sub = create :subscription
    expect(sub).to_not respond_to :customer
  end
end
