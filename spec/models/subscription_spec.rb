require "rails_helper"

RSpec.describe Subscription, type: :model do
  before(:each) do
    DatabaseCleaner.clean
  end

  it { should validate_presence_of :title }
  it { should validate_presence_of :price }
  it { should validate_presence_of :status }
  it { should validate_presence_of :frequency }

  it "should have a tea" do
    customer = create(:customer)
    tea = create(:tea)
    sub = create(:subscription, tea_ids: [tea.id], customer: customer)
    # customer.add_subscription(create(:subscription, teas: [tea]))
    expect(sub.teas).to include(tea)
  end
end
