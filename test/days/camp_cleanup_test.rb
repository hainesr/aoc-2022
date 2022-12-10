# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/camp_cleanup'

class AOC2022::CampCleanupTest < Minitest::Test
  INPUT = <<~EOI
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
  EOI

  RANGES = [
    [(2..4), (6..8)],
    [(2..3), (4..5)],
    [(5..7), (7..9)],
    [(2..8), (3..7)],
    [(6..6), (4..6)],
    [(2..6), (4..8)]
  ].freeze

  def setup
    @cc = AOC2022::CampCleanup.new
    @cc.setup(INPUT)
  end

  def test_parse_input
    assert_equal(RANGES, @cc.instance_variable_get(:@ranges))
  end

  def test_sections_covered?
    refute(@cc.sections_covered?(RANGES[0]))
    refute(@cc.sections_covered?(RANGES[1]))
    refute(@cc.sections_covered?(RANGES[2]))
    assert(@cc.sections_covered?(RANGES[3]))
    assert(@cc.sections_covered?(RANGES[4]))
    refute(@cc.sections_covered?(RANGES[5]))
  end

  def test_sections_overlap?
    refute(@cc.sections_overlap?(RANGES[0]))
    refute(@cc.sections_overlap?(RANGES[1]))
    assert(@cc.sections_overlap?(RANGES[2]))
    assert(@cc.sections_overlap?(RANGES[3]))
    assert(@cc.sections_overlap?(RANGES[4]))
    assert(@cc.sections_overlap?(RANGES[5]))
  end

  def test_part1
    assert_equal(2, @cc.part1)
  end

  def test_part2
    assert_equal(4, @cc.part2)
  end
end
