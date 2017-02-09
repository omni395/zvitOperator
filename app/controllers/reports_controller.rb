class ReportsController < ApplicationController
  def index
    @payments_today = Payment.report_today
    @payments_week = Payment.report_week
    @payments_month = Payment.report_month
    @payments_by_date = Payment.report_by_date(params[:start_date], params[:end_date])
    @expences_today = Expence.report_today
    @expences_week = Expence.report_week
    @expences_month = Expence.report_month
    @expences_by_date = Expence.report_by_date(params[:start_date], params[:end_date])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Report_from_#{(Date.today - 6.day).strftime('%d.%m.%Y')}_to_#{(Date.today).strftime('%d.%m.%Y')}",
               template: 'reports/pdf_report.html.haml',
               page_size: "A4",
               disposition: 'attachment'
      end
    end
  end

  private
    def report_params
      params.require(:report).permit(:start_date, :end_date)
    end
end