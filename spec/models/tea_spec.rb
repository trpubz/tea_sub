require "rails_helper"

RSpec.describe Tea, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :temperature }
  it { should validate_presence_of :brew_time }

  it "can live outside of a subscription and customer" do
    tea = create :tea
    expect(tea.id).to be_a(BSON::ObjectId)
  end
end
