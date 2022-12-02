# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/rock_paper_scissors'

class AOC2022::RockPaperScissorsTest < MiniTest::Test
  INPUT = <<~EOI
    A Y
    B X
    C Z
  EOI

  ROUNDS = [[:A, :Y], [:B, :X], [:C, :Z]].freeze

  def setup
    @rps = AOC2022::RockPaperScissors.new
    @rps.setup(INPUT)
  end

  def test_parse_rounds
    assert_equal(ROUNDS, @rps.instance_variable_get(:@rounds))
  end

  def test_play_round
    assert_equal(8, @rps.play_round(ROUNDS[0]))
    assert_equal(1, @rps.play_round(ROUNDS[1]))
    assert_equal(6, @rps.play_round(ROUNDS[2]))
  end

  def test_part1
    assert_equal(15, @rps.part1)
  end
end
