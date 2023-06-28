# frozen_string_literal: true

# == Group
# @param [Array] members
class Group
  def initialize(members)
    @members = members
  end

  # == random_grouping
  # グループを3人と3人、または2人と4人にランダムに分ける
  # @return [Array] members
  def random_grouping
    number_of_people = [3, 4].sample
    @members.shuffle.each_slice(number_of_people) do |member|
      p member.sort
    end
  end
end

members = %w[A B C D E F]
group = Group.new(members)
group.random_grouping
