# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/rope_bridge'

class AOC2022::RopeBridgeTest < MiniTest::Test
  INPUT = <<~EOI
    R 4
    U 4
    L 3
    D 1
    R 4
    D 1
    L 5
    R 2
  EOI

  def setup
    @rb = AOC2022::RopeBridge.new
    @rb.setup(INPUT)
  end

  def test_read_moves
    assert_equal(24, @rb.moves.length)
    assert_equal([1, 0], @rb.moves[0])
    assert_equal([0, 1], @rb.moves[4])
    assert_equal([-1, 0], @rb.moves[-3])
  end

  def test_move
    @rb.move(@rb.moves[0])
    assert_equal([1, 0], @rb.head)
    assert_equal([0, 0], @rb.tail)
    assert_equal({ [0, 0] => 1 }, @rb.tail_visited)

    @rb.move(@rb.moves[1])
    assert_equal([2, 0], @rb.head)
    assert_equal([1, 0], @rb.tail)
    assert_equal({ [0, 0] => 1, [1, 0] => 1 }, @rb.tail_visited)

    @rb.move(@rb.moves[4])
    assert_equal([2, 1], @rb.head)
    assert_equal([1, 0], @rb.tail)
    assert_equal({ [0, 0] => 1, [1, 0] => 1 }, @rb.tail_visited)

    @rb.move(@rb.moves[5])
    assert_equal([2, 2], @rb.head)
    assert_equal([2, 1], @rb.tail)
    assert_equal({ [0, 0] => 1, [1, 0] => 1, [2, 1] => 1 }, @rb.tail_visited)
  end

  def test_part1
    assert_equal(13, @rb.part1)
  end
end
