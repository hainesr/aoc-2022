# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/full_of_hot_air'

class AOC2022::FullOfHotAirText < Minitest::Test
  INPUT = <<~EOI
    1=-0-2
    12111
    2=0=
    21
    2=01
    111
    20012
    112
    1=-1=
    1-12
    12
    1=
    122
  EOI

  def setup
    @foha = AOC2022::FullOfHotAir.new
    @foha.setup(INPUT)
  end

  def test_add_snafu
    assert_equal('20', @foha.add_snafu('12', '1='))
    assert_equal('1-2', @foha.add_snafu('21', '21'))
  end

  def test_part1
    assert_equal('2=-1=0', @foha.part1)
  end
end
