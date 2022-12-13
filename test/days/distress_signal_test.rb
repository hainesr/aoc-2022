# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/distress_signal'

class AOC2022::DistressSignalTest < Minitest::Test
  INPUT = <<~EOI
    [1,1,3,1,1]
    [1,1,5,1,1]

    [[1],[2,3,4]]
    [[1],4]

    [9]
    [[8,7,6]]

    [[4,4],4,4]
    [[4,4],4,4,4]

    [7,7,7,7]
    [7,7,7]

    []
    [3]

    [[[]]]
    [[]]

    [1,[2,[3,[4,[5,6,7]]]],8,9]
    [1,[2,[3,[4,[5,6,0]]]],8,9]
  EOI

  SORTED = [
    [],
    [[]],
    [[[]]],
    [1, 1, 3, 1, 1],
    [1, 1, 5, 1, 1],
    [[1], [2, 3, 4]],
    [1, [2, [3, [4, [5, 6, 0]]]], 8, 9],
    [1, [2, [3, [4, [5, 6, 7]]]], 8, 9],
    [[1], 4],
    [3],
    [[4, 4], 4, 4],
    [[4, 4], 4, 4, 4],
    [7, 7, 7],
    [7, 7, 7, 7],
    [[8, 7, 6]],
    [9]
  ].freeze

  def setup
    @ds = AOC2022::DistressSignal.new
  end

  def test_read_pairs
    pairs = @ds.read_pairs(INPUT)

    assert_equal([[1, 1, 3, 1, 1], [1, 1, 5, 1, 1]], pairs[0])
    assert_equal([[[1], [2, 3, 4]], [[1], 4]], pairs[1])
    assert_equal([[9], [[8, 7, 6]]], pairs[2])
  end

  def test_ordered?
    pairs = @ds.read_pairs(INPUT)

    assert(@ds.ordered?([1, 2]))
    refute(@ds.ordered?([2, 1]))

    assert(@ds.ordered?([[1], [2]]))
    refute(@ds.ordered?([[2], [1]]))

    assert(@ds.ordered?([[1], [1, 2]]))
    refute(@ds.ordered?([[1, 2], [1]]))
    assert(@ds.ordered?([[1, 2], [2]]))

    assert(@ds.ordered?([[], [1]]))
    refute(@ds.ordered?([[1], []]))

    assert(@ds.ordered?([[[]], [[[]]]]))
    refute(@ds.ordered?([[[[]]], [[]]]))

    assert(@ds.ordered?([[1], 2]))
    refute(@ds.ordered?([2, [1]]))

    assert(@ds.ordered?(pairs[0]))
    assert(@ds.ordered?(pairs[1]))
    refute(@ds.ordered?(pairs[2]))
    assert(@ds.ordered?(pairs[3]))
    refute(@ds.ordered?(pairs[4]))
    assert(@ds.ordered?(pairs[5]))
    refute(@ds.ordered?(pairs[6]))
    refute(@ds.ordered?(pairs[7]))
  end

  def test_sorted
    packets = @ds.read_pairs(INPUT).flatten(1)
    assert_equal(SORTED, packets.sort)
  end

  def test_part1
    @ds.setup(INPUT)
    assert_equal(13, @ds.part1)
  end

  def test_part2
    @ds.setup(INPUT)
    assert_equal(140, @ds.part2)
  end
end
