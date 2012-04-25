module LeaveCalender
  
  require 'date'

  def days_in_months(year, month)
    (Date.new(year, 12, 31) << (12-month)).day
  end

  def first_day_of_month(date = Date.today)
    @first_day = date - (date.day-1)
  end

  def days_array(date = Date.today)
    first_day = first_day_of_month(date)
    all_week = []
    first_week = []
    print_day = 1
    for week_day in 1..7
      if week_day < first_day.cwday
        first_week << " "
      else
        first_week << print_day
        print_day = print_day + 1
      end
    end
    all_week << first_week
    total_days_in_month = days_in_months(date.year, date.month)
    next_week = []
    count = 0
    for week_day in print_day..total_days_in_month
      count = count + 1
      if count % 7 == 0 || week_day == total_days_in_month
        next_week << week_day
        all_week << next_week
        next_week = []
      else
        next_week << week_day
      end
    end
    last_week = all_week.pop
    for day in last_week.size+1..7
      last_week << " "
    end
    all_week << last_week
  end

  def convert_to_date(year, month, day)
    Date.new(year, month, day)
  end

  def actual_start_date(date)
    (date.cwday == 1) ? (date << 2) : date
  end

  def actual_end_date(date)
    (date.cwday == 5) ? (date >> 2) : date
  end

  def day_of_week(year, month, day)
    Date.new(year, month, day).strftime("%a")
  end

end