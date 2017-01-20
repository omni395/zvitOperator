class DashboardController < ApplicationController
  def index
    @payments = Payment.all
    @today_payments = Payment.today
    @week_paymens = Payment.week
    @month_payments = Payment.month
  end
end