# frozen_string_literal: true

par = gets.chomp.split(',')
score = gets.chomp.split(',')

difference = (0...score.size).to_a.map do |n|
  score[n].to_i - par[n].to_i
end

judge = (0...score.size).to_a.map do |n|
  if difference[n] == -4
    'コンドル'
  elsif score[n].to_i == 1
    'ホールインワン'
  elsif difference[n] == -3
    'アルバトロス'
  elsif difference[n] == -2
    'イーグル'
  elsif difference[n] == -1
    'バーディ'
  elsif difference[n].zero?
    'パー'
  elsif difference[n] == 1
    'ボギー'
  elsif difference[n] >= 2
    "#{difference[n]}ボギー"
  end
end

puts judge.join(',')
