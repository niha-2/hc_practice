# frozen_string_literal: true

require 'optparse'
require 'date'

year = Date.today.year
month_num = Date.today.month
mday_today = Date.today.mday

# オプション解析
opt = OptionParser.new
opt.on('-m')
opt.parse!(ARGV)
if ARGV[0] && !(1..12).include?(ARGV[0].to_i)
  puts "#{ARGV[0]} is neither a month number (1..12) nor a name"
  exit
end

month_num = ARGV[0].to_i if ARGV[0]

# 指定月の1日の曜日を求める
wday_first = Date.new(year, month_num, 1).wday.zero? ? 7 : Date.new(year, month_num, 1).wday

# 指定月の日数を求める
days = 31
[4, 6, 9, 11].include?(month_num) ? days = 30 : nil
month_num == 2 ? days = 28 : nil
days = 29 if month_num == 2 && ((year % 4).zero? && (year % 100).nonzero? || (year % 400).zero?)

# カレンダーを出力する
months = %w[January February March April May June July August September October November December]
output = "    #{months[month_num - 1]} #{year}\nMo Tu We Th Fr Sa Su\n"
numbers = (1..days).to_a
numbers.each do |n|
  output += ' ' * 3 * (wday_first - 1) if n == 1
  if n == mday_today && month_num == Date.today.month && year == Date.today.year
    output += n < 10 ? "\e[30;47m #{n}\e[0m " : " \e[30;47m#{n}\e[0m"
  else
    output += n < 10 ? " #{n} " : "#{n} "
  end
  output += "\n" if ((n + wday_first - 1) % 7).zero?
end
puts output
