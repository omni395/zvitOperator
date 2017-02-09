module Report
  extend ActiveSupport::Concern

  module ClassMethods
    #
    # Выборки по датам
    #
    def report_today
      where("updated_at >= ?", Date.today.to_date)
    end

    def report_week
      now = Date.today.to_date
      if now.wednesday?
        now -= 6.day
        where('updated_at >= ? AND updated_at <= ?', now, Date.today.to_date + 1.day)
      else
        until now.wednesday?
          now -= 1.day
        end
        where('updated_at >= ? AND updated_at <= ?', now, Date.today.to_date + 1.day)
      end
    end

    def report_month
      year = Date.today.year
      month = Date.today.month
      where('updated_at >= ? AND updated_at <= ?', Date.new(year, month, 1), Date.today.to_date + 1.day)
    end

    def report_by_date(start_date, end_date)
      where('updated_at >= ? AND updated_at <= ?', start_date, end_date)
    end

    #
    # Подсчет общей суммы расходов то датам
    #
    def total_and_percent_report(period)
      total_report_today,  percent_report_today = 0, 0
      period.each do |report|
        total_report_today += report.payment_total
      end
      percent_report_today = total_report_today * 0.05
      return total_report_today,  percent_report_today, period.length
    end
  end
end