# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/treetop_tree_house'

class AOC2022::TreetopTreeHouseTest < Minitest::Test
  INPUT = <<~EOI
    30373
    25512
    65332
    33549
    35390
  EOI

  MAP = [
    { height: 3, visible: true, score: 0 },
    { height: 0, visible: true, score: 0 },
    { height: 3, visible: true, score: 0 },
    { height: 7, visible: true, score: 0 },
    { height: 3, visible: true, score: 0 },
    { height: 2, visible: true, score: 0 },
    { height: 5, visible: true, score: 1 },
    { height: 5, visible: true, score: 4 },
    { height: 1, visible: false, score: 1 },
    { height: 2, visible: true, score: 0 },
    { height: 6, visible: true, score: 0 },
    { height: 5, visible: true, score: 6 },
    { height: 3, visible: false, score: 1 },
    { height: 3, visible: true, score: 2 },
    { height: 2, visible: true, score: 0 },
    { height: 3, visible: true, score: 0 },
    { height: 3, visible: false, score: 1 },
    { height: 5, visible: true, score: 8 },
    { height: 4, visible: false, score: 3 },
    { height: 9, visible: true, score: 0 },
    { height: 3, visible: true, score: 0 },
    { height: 5, visible: true, score: 0 },
    { height: 3, visible: true, score: 0 },
    { height: 9, visible: true, score: 0 },
    { height: 0, visible: true, score: 0 }
  ].freeze

  def setup
    @tth = AOC2022::TreetopTreeHouse.new
    @tth.setup(INPUT)
  end

  def test_process_heights
    assert_equal(MAP, @tth.instance_variable_get(:@map))
  end

  def test_part1
    assert_equal(21, @tth.part1)
  end

  def test_part2
    assert_equal(8, @tth.part2)
  end
end
