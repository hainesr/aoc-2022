# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/treetop_tree_house'

class AOC2022::TreetopTreeHouseTest < MiniTest::Test
  INPUT = <<~EOI
    30373
    25512
    65332
    33549
    35390
  EOI

  MAP = [
    [
      { height: 3, visible: true }, { height: 0, visible: true },
      { height: 3, visible: true }, { height: 7, visible: true }, { height: 3, visible: true }
    ], [
      { height: 2, visible: true }, { height: 5, visible: true },
      { height: 5, visible: true }, { height: 1, visible: false }, { height: 2, visible: true }
    ], [
      { height: 6, visible: true }, { height: 5, visible: true },
      { height: 3, visible: false }, { height: 3, visible: true }, { height: 2, visible: true }
    ], [
      { height: 3, visible: true }, { height: 3, visible: false },
      { height: 5, visible: true }, { height: 4, visible: false }, { height: 9, visible: true }
    ], [
      { height: 3, visible: true }, { height: 5, visible: true },
      { height: 3, visible: true }, { height: 9, visible: true }, { height: 0, visible: true }
    ]
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
end
