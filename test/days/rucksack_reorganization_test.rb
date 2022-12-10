# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/rucksack_reorganization'

class AOC2022::RucksackReorganizationTest < Minitest::Test
  INPUT = <<~EOI
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
  EOI

  RUCKSACKS = [
    [
      ['v', 'J', 'r', 'w', 'p', 'W', 't', 'w', 'J', 'g', 'W', 'r'],
      ['h', 'c', 's', 'F', 'M', 'M', 'f', 'F', 'F', 'h', 'F', 'p']
    ], [
      ['j', 'q', 'H', 'R', 'N', 'q', 'R', 'j', 'q', 'z', 'j', 'G', 'D', 'L', 'G', 'L'],
      ['r', 's', 'F', 'M', 'f', 'F', 'Z', 'S', 'r', 'L', 'r', 'F', 'Z', 's', 'S', 'L']
    ], [
      ['P', 'm', 'm', 'd', 'z', 'q', 'P', 'r', 'V'],
      ['v', 'P', 'w', 'w', 'T', 'W', 'B', 'w', 'g']
    ], [
      ['w', 'M', 'q', 'v', 'L', 'M', 'Z', 'H', 'h', 'H', 'M', 'v', 'w', 'L', 'H'],
      ['j', 'b', 'v', 'c', 'j', 'n', 'n', 'S', 'B', 'n', 'v', 'T', 'Q', 'F', 'n']
    ], [
      ['t', 't', 'g', 'J', 't', 'R', 'G', 'J'],
      ['Q', 'c', 't', 'T', 'Z', 't', 'Z', 'T']
    ], [
      ['C', 'r', 'Z', 's', 'J', 's', 'P', 'P', 'Z', 's', 'G', 'z'],
      ['w', 'w', 's', 'L', 'w', 'L', 'm', 'p', 'w', 'M', 'D', 'w']
    ]
  ].freeze

  def setup
    @rr = AOC2022::RucksackReorganization.new
    @rr.setup(INPUT)
  end

  def test_priority
    assert_equal(1, @rr.priority('a'))
    assert_equal(26, @rr.priority('z'))
    assert_equal(27, @rr.priority('A'))
    assert_equal(52, @rr.priority('Z'))
  end

  def test_common_item_type
    assert_equal('p', @rr.common_item_type(RUCKSACKS[0]))
    assert_equal('L', @rr.common_item_type(RUCKSACKS[1]))
    assert_equal('P', @rr.common_item_type(RUCKSACKS[2]))
    assert_equal('v', @rr.common_item_type(RUCKSACKS[3]))
    assert_equal('t', @rr.common_item_type(RUCKSACKS[4]))
    assert_equal('s', @rr.common_item_type(RUCKSACKS[5]))
  end

  def test_common_item_type3
    assert_equal('r', @rr.common_item_type3(RUCKSACKS[0..2]))
    assert_equal('Z', @rr.common_item_type3(RUCKSACKS[3..]))
  end

  def test_parse_input
    assert_equal(RUCKSACKS, @rr.instance_variable_get(:@rucksacks))
  end

  def test_part1
    assert_equal(157, @rr.part1)
  end

  def test_part2
    assert_equal(70, @rr.part2)
  end
end
