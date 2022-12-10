# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/supply_stacks'

class AOC2022::SupplyStacksTest < Minitest::Test
  INPUT = <<~EOI
        [D]
    [N] [C]
    [Z] [M] [P]
     1   2   3

    move 1 from 2 to 1
    move 3 from 1 to 3
    move 2 from 2 to 1
    move 1 from 1 to 2
  EOI

  STACKS = [['Z', 'N'], ['M', 'C', 'D'], ['P']].freeze
  MOVES = [[1, 2, 1], [3, 1, 3], [2, 2, 1], [1, 1, 2]].freeze

  def setup
    @ss = AOC2022::SupplyStacks.new
    @ss.setup(INPUT)
  end

  def test_parse_input
    assert_equal(STACKS, @ss.instance_variable_get(:@stacks))
    assert_equal(MOVES, @ss.instance_variable_get(:@moves))
  end

  def test_move
    @ss.move(MOVES[0])
    assert_equal(
      [['Z', 'N', 'D'], ['M', 'C'], ['P']],
      @ss.instance_variable_get(:@stacks)
    )

    @ss.move(MOVES[1])
    assert_equal(
      [[], ['M', 'C'], ['P', 'D', 'N', 'Z']],
      @ss.instance_variable_get(:@stacks)
    )
  end

  def test_move_cm9001
    @ss.move(MOVES[0], cm9001: true)
    assert_equal(
      [['Z', 'N', 'D'], ['M', 'C'], ['P']],
      @ss.instance_variable_get(:@stacks)
    )

    @ss.move(MOVES[1], cm9001: true)
    assert_equal(
      [[], ['M', 'C'], ['P', 'Z', 'N', 'D']],
      @ss.instance_variable_get(:@stacks)
    )
  end

  def test_part1
    assert_equal('CMZ', @ss.part1)
  end

  def test_part2
    assert_equal('MCD', @ss.part2)
  end
end
