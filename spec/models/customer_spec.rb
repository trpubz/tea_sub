require "rails_helper"

RSpec.describe Customer, type: :model do
  before :each do
    DatabaseCleaner.clean
  end

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :address }

  it "creates empty array for subscriptions" do
    customer = create :customer
    expect(customer.subscriptions).to eq []
  end
end
