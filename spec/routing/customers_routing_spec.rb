require "rails_helper"

RSpec.describe CustomersController, type: :routing do
  describe "routing" do
    before :each do
      DatabaseCleaner.clean
      @customer = create :customer
    end

    it "routes to #index" do
      expect(get: "/customers").to route_to("customers#index")
    end

    it "routes to #show" do
      expect(get: "/customers/#{@customer.id}")
        .to route_to("customers#show", id: @customer.id.to_s)
    end

    it "routes to #create" do
      expect(post: "/customers").to route_to("customers#create")
    end

    it "routes to #add_sub via PATCH" do
      expect(patch: "/customers/#{@customer.id}/add_subscription")
        .to route_to("customers#add_subscription", id: @customer.id.to_s)
    end

    xit "routes to #destroy" do
      expect(delete: "/customers/1").to route_to("customers#destroy", id: "1")
    end
  end
end
