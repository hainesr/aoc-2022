# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/proboscidea_volcanium'

class AOC2022::ProboscideaVolcaniumTest < Minitest::Test
  INPUT = <<~EOI
    Valve AA has flow rate=0; tunnels lead to valves DD, II, BB
    Valve BB has flow rate=13; tunnels lead to valves CC, AA
    Valve CC has flow rate=2; tunnels lead to valves DD, BB
    Valve DD has flow rate=20; tunnels lead to valves CC, AA, EE
    Valve EE has flow rate=3; tunnels lead to valves FF, DD
    Valve FF has flow rate=0; tunnels lead to valves EE, GG
    Valve GG has flow rate=0; tunnels lead to valves FF, HH
    Valve HH has flow rate=22; tunnel leads to valve GG
    Valve II has flow rate=0; tunnels lead to valves AA, JJ
    Valve JJ has flow rate=21; tunnel leads to valve II
  EOI

  def setup
    @pv = AOC2022::ProboscideaVolcanium.new
  end

  def test_read_map
    map, rates = @pv.read_map(INPUT)

    assert_equal(10, map.size)
    assert_equal(%w[AA BB CC DD EE FF GG HH II JJ], map.keys)
    assert_equal(0, rates['AA'])
    assert_equal({ 'CC' => 1, 'AA' => 1, 'EE' => 1 }, map['DD'])
  end

  def test_process_map
    map, rates = @pv.read_map(INPUT)
    map = @pv.process_map(map, rates)

    assert_equal(7, map.size)
    assert_equal(%w[AA BB CC DD EE HH JJ], map.keys)
    map.each do |_, node|
      assert_equal(7, node.size)
    end
  end

  def test_find_paths
    map, rates = @pv.read_map(INPUT)
    map = @pv.process_map(map, rates)

    paths, pressures = @pv.find_paths(map, rates, 30)
    assert_equal(720, paths.size)
    assert_equal(720, pressures.size)
    assert_equal(1651, pressures.max)
  end

  def test_part1
    @pv.setup(INPUT)
    assert_equal(1651, @pv.part1)
  end
end
