# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/tuning_trouble'

class AOC2022::TuningTroubleTest < Minitest::Test
  INPUT1 = 'mjqjpqmgbljsphdztnvjfqwrcgsmlb'

  def setup
    @tt = AOC2022::TuningTrouble.new
    @tt.setup(INPUT1)
  end

  def test_part1
    assert_equal(7, @tt.part1)
  end

  def test_part2
    assert_equal(19, @tt.part2)
  end
end
