# frozen_string_literal: true

par = gets.chomp.split(',')
score = gets.chomp.split(',')

difference = []
(0...score.size).each do |n|
  difference << score[n].to_i - par[n].to_i
end

judge = []

(0...score.size).each do |n|
  if difference[n] == -4
    judge << 'コンドル'
  elsif score[n].to_i == 1
    judge << 'ホールインワン'
  elsif difference[n] == -3
    judge << 'アルバトロス'
  elsif difference[n] == -2
    judge << 'イーグル'
  elsif difference[n] == -1
    judge << 'バーディ'
  elsif difference[n].zero?
    judge << 'パー'
  elsif difference[n] == 1
    judge << 'ボギー'
  elsif difference[n] >= 2
    judge << "#{difference[n]}ボギー"
  end
end

puts judge.join(',')
