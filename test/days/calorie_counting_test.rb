# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/calorie_counting'

class AOC2022::CalorieCountingTest < MiniTest::Test
  INPUT = <<~EOI
    1000
    2000
    3000

    4000

    5000
    6000

    7000
    8000
    9000

    10000
  EOI

  PACKS = [
    [1_000, 2_000, 3_000], [4_000], [5_000, 6_000], [7_000, 8_000, 9_000], [10_000]
  ].freeze

  def setup
    @cc = AOC2022::CalorieCounting.new
    @cc.setup(INPUT)
  end

  def test_parse_rations
    assert_equal(PACKS, @cc.parse_rations(INPUT))
  end

  def test_part1
    assert_equal(24_000, @cc.part1)
  end

  def test_part2
    assert_equal(45_000, @cc.part2)
  end
end
