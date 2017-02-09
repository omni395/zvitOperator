module Reportable
  extend ActiveSupport::Concern

  module ClassMethods
    #
    # Выборки по датам
    #
    def report_today
      where("created_at >= ?", Date.today.to_date)
    end

    def report_week
      now = Date.today.to_date
      if now.wednesday?
        now -= 6.day
        where('created_at >= ? AND created_at <= ?', now, Date.today.to_date + 1.day)
      else
        until now.wednesday?
          now -= 1.day
        end
        where('created_at >= ? AND created_at <= ?', now, Date.today.to_date + 1.day)
      end
    end

    def report_month
      year = Date.today.year
      month = Date.today.month
      where('created_at >= ? AND created_at <= ?', Date.new(year, month, 1), Date.today.to_date + 1.day)
    end

    def report_by_date(start_date, end_date)
      where('created_at >= ? AND created_at <= ?', start_date, end_date)
    end
  end
end