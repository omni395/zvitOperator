class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def report
    @report_today = Payment.report_today
    @report_week = Payment.report_week
    @report_month = Payment.report_month
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Report_from_#{(Date.today - 6.day).strftime('%d.%m.%Y')}_to_#{(Date.today).strftime('%d.%m.%Y')}",
               template: 'payments/pdf_report.html.haml',
               page_size: "A4",
               disposition: 'attachment'
      end
    end
  end

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
    @payment = Payment.new
    @payment.material_payments.build
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @material_payments = MaterialPayment.where(payment_id: @payment)
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = current_user.payments.new(payment_params)
    respond_to do |format|
      if @payment.save
        format.html {
          # Если новое подключение перенаправляется кк платежу для добавления материалов
          if @payment.client_new_connection
            redirect_to @payment, notice: 'Платеж добавлен. Этот новое подключение. Необходимо добавить материалы.  '
          # Иначе к списку платежей
          else
            redirect_to payments_path, notice: 'Платеж добавлен.'
          end }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    #@payment = Payment.find(params[:id])
    #@payment.material_payments.update_all(payment_params)

    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Платеж изменен.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Платеж удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:client_address,
                                      :client_name,
                                      :client_payment,
                                      :client_description,
                                      :client_new_connection,
                                      :material_payments_attributes => [:id, :material_id, :payment_id, :quantity, :_destroy])
    end
end