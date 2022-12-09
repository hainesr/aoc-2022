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
  end

  def test_read_moves
    moves = @rb.read_moves(INPUT)
    assert_equal(24, moves.length)
    assert_equal([1, 0], moves[0])
    assert_equal([0, 1], moves[4])
    assert_equal([-1, 0], moves[-3])
  end

  def test_move
    moves = @rb.read_moves(INPUT)
    rope = [[0, 0]] * AOC2022::RopeBridge::ROPE_LENGTH
    tail_visited = [Hash.new(0), Hash.new(0)]

    @rb.move(rope, moves[0], tail_visited)
    assert_equal([1, 0], rope[0])
    assert_equal([0, 0], rope[1])
    assert_equal([{ [0, 0] => 1 }, { [0, 0] => 1 }], tail_visited)

    @rb.move(rope, moves[1], tail_visited)
    assert_equal([2, 0], rope[0])
    assert_equal([1, 0], rope[1])
    assert_equal([{ [0, 0] => 1, [1, 0] => 1 }, { [0, 0] => 2 }], tail_visited)

    @rb.move(rope, moves[4], tail_visited)
    assert_equal([2, 1], rope[0])
    assert_equal([1, 0], rope[1])
    assert_equal([{ [0, 0] => 1, [1, 0] => 2 }, { [0, 0] => 3 }], tail_visited)

    @rb.move(rope, moves[5], tail_visited)
    assert_equal([2, 2], rope[0])
    assert_equal([2, 1], rope[1])
    assert_equal([{ [0, 0] => 1, [1, 0] => 2, [2, 1] => 1 }, { [0, 0] => 4 }], tail_visited)
  end

  def test_part1
    @rb.setup(INPUT)
    assert_equal(13, @rb.part1)
  end

  def test_part2
    @rb.setup(INPUT)
    assert_equal(1, @rb.part2)
  end
end
