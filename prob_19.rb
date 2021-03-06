# You are given the following information, but you may prefer to do some research for yourself.
# 
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

def count_sundays
  month_hash = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 
    9 => 30, 10 => 31, 11 => 30, 12 => 31} 
  index = 0
  date = 1
  month = 1
  year = 1901
  sunday_count = 0
  while year < 2001
    if date == 1 && index % 7 == 5
      sunday_count += 1
    end
    month_end = month_hash[month]
    month_end += 1 if ( month == 2 && year % 4 == 0 )
    if date == month_end
      date = 1
      if month == 12
        month = 1
        year += 1
      else
        month += 1
      end
    else
      date += 1
    end
    index += 1  
  end
  puts sunday_count
end

count_sundays
