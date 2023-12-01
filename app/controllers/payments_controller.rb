class PaymentsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_category

  def index
    @payments = Payment.where(user: current_user, category_id: @category.id).order(updated_at: :desc)
    @total = @payments.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @payment = Payment.new
    @user = current_user
  end

  def create
    @user = current_user
    @categories = Category.all
    @payment = Payment.new(payment_params)
    @payment.user = @user
    if @payment.save
      redirect_to category_payments_path(@payment.category_id)
    else
      pp @payment.errors
      render 'new'
    end
  end

  private

  def find_category
    @category = Category.find(params[:category_id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id)
  end
end
