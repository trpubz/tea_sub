class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show cancel_subscription add_subscription]

  # GET /customers
  def index
    @customers = Customer.all

    render json: @customers
  end

  # GET /customers/1
  def show
    render json: @customer
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  # def update
  #   if @customer.update(customer_params)
  #     render json: @customer
  #   else
  #     render json: @customer.errors, status: :unprocessable_entity
  #   end
  # end
  def add_subscription
    @customer.add_subscription(subscription_params)

    render json: @customer
  end

  # PATCH /customers/1
  def cancel_subscription
    @customer.cancel_subscription(params[:subscription_id])

    render json: @customer
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :address)
  end

  def subscription_params
    # require 'pry'; binding.pry
    # permitting parameters for an array in a controller, you need to explicitly inform
    # Rails that you expect an array for that parameter
    params.require(:subscription).permit(:title, :price, :frequency, :status, tea_ids: [])
  end
end
