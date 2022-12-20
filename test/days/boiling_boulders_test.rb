# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/boiling_boulders'

class AOC2022::BoilingBouldersTest < Minitest::Test
  INPUT = <<~EOI
    2,2,2
    1,2,2
    3,2,2
    2,1,2
    2,3,2
    2,2,1
    2,2,3
    2,2,4
    2,2,6
    1,2,5
    3,2,5
    2,1,5
    2,3,5
  EOI

  def setup
    @bb = AOC2022::BoilingBoulders.new
  end

  def test_read_boulders
    boulders = @bb.read_boulders(INPUT)

    assert_equal(13, boulders.length)
    assert_equal([2, 2, 2], boulders[0])
    assert_equal([2, 3, 5], boulders[-1])
  end

  def test_part1
    @bb.setup(INPUT)
    assert_equal(64, @bb.part1)
  end
end
