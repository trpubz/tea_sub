require "rails_helper"

RSpec.describe "/customers", type: :request do
  after :each do
    DatabaseCleaner.clean
  end
  # This should return the minimal set of attributes required to create a valid
  # Customer. As you add validations to Customer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      first_name: "Robby",
      last_name: "Taylor",
      email: "rt@pupnsuds.net",
      address: "SAME AS SPONSOR"
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # CustomersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Customer.create! valid_attributes
      get customers_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      customer = Customer.create! valid_attributes
      get customer_url(customer), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Customer" do
        expect {
          post customers_url,
            params: {customer: valid_attributes}, headers: valid_headers, as: :json
        }.to change(Customer, :count).by(1)
      end

      it "renders a JSON response with the new customer" do
        post customers_url,
          params: {customer: valid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Customer" do
        expect {
          post customers_url,
            params: {customer: invalid_attributes}, as: :json
        }.to change(Customer, :count).by(0)
      end

      it "renders a JSON response with errors for the new customer" do
        post customers_url,
          params: {customer: invalid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /add_subscription" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          subscription: {
            title: "ProPlus+",
            price: 50,
            status: "active",
            frequency: 15
          }
        }
      }

      it "updates the requested customer" do
        customer = Customer.create! valid_attributes
        patch add_subscription_customer_url(customer),
          params: new_attributes, headers: valid_headers, as: :json
        customer.reload
        expect(customer.subscriptions.first.title).to eq("ProPlus+")
      end

      it "renders a JSON response with the customer" do
        customer = Customer.create! valid_attributes
        patch add_subscription_customer_url(customer),
          params: new_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the customer" do
        customer = Customer.create! valid_attributes
        patch add_subscription_customer_url(customer),
          params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    xit "destroys the requested customer" do
      customer = Customer.create! valid_attributes
      expect {
        delete customer_url(customer), headers: valid_headers, as: :json
      }.to change(Customer, :count).by(-1)
    end
  end
end
