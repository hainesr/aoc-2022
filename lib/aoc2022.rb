# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'rubygems'
require 'bundler/setup'

require 'aoc2022/day'

module AOC2022
  INPUT_DIR = ::File.expand_path('../etc', __dir__)

  DAY_MAP = [
    nil, # There is no day zero!
    'calorie_counting',
    'rock_paper_scissors',
    'rucksack_reorganization'
  ].freeze

  def self.class_from_day(day)
    class_name = day.split('_').map(&:capitalize).join
    class_path = "AOC2022::#{class_name}"
    class_path.split('::').reduce(Object) { |o, c| o.const_get c }
  end
end
