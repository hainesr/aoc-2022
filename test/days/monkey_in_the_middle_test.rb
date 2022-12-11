# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/monkey_in_the_middle'

class AOC2022::MonkeyInTheMiddleTest < Minitest::Test
  INPUT = <<~EOI
    Monkey 0:
      Starting items: 79, 98
      Operation: new = old * 19
      Test: divisible by 23
        If true: throw to monkey 2
        If false: throw to monkey 3

    Monkey 1:
      Starting items: 54, 65, 75, 74
      Operation: new = old + 6
      Test: divisible by 19
        If true: throw to monkey 2
        If false: throw to monkey 0

    Monkey 2:
      Starting items: 79, 60, 97
      Operation: new = old * old
      Test: divisible by 13
        If true: throw to monkey 1
        If false: throw to monkey 3

    Monkey 3:
      Starting items: 74
      Operation: new = old + 3
      Test: divisible by 17
        If true: throw to monkey 0
        If false: throw to monkey 1
  EOI

  def setup
    @mm = AOC2022::MonkeyInTheMiddle.new
    @mm.setup(INPUT)
  end

  def test_parse_monkeys
    monkeys = @mm.parse_monkeys(INPUT)

    assert_equal(
      { items: [79, 98], op: [:*, 19], test: 23, if_true: 2, if_false: 3, inspected: 0 },
      monkeys[0]
    )
    assert_equal(
      { items: [54, 65, 75, 74], op: [:+, 6], test: 19, if_true: 2, if_false: 0, inspected: 0 },
      monkeys[1]
    )
    assert_equal(
      { items: [79, 60, 97], op: [:**, 2], test: 13, if_true: 1, if_false: 3, inspected: 0 },
      monkeys[2]
    )
    assert_equal(
      { items: [74], op: [:+, 3], test: 17, if_true: 0, if_false: 1, inspected: 0 },
      monkeys[3]
    )
  end

  def test_monkey_turn
    monkeys = @mm.parse_monkeys(INPUT)

    @mm.monkey_turn(monkeys, 0)
    assert_equal(2, monkeys[0][:inspected])
    assert_equal([], monkeys[0][:items])
    assert_equal([74, 500, 620], monkeys[3][:items])

    @mm.monkey_turn(monkeys, 1)
    assert_equal(4, monkeys[1][:inspected])
    assert_equal([], monkeys[1][:items])
    assert_equal([20, 23, 27, 26], monkeys[0][:items])
  end

  def test_round
    monkeys = @mm.parse_monkeys(INPUT)
    @mm.round(monkeys)

    assert_equal(2, monkeys[0][:inspected])
    assert_equal([20, 23, 27, 26], monkeys[0][:items])

    assert_equal(4, monkeys[1][:inspected])
    assert_equal([2080, 25, 167, 207, 401, 1046], monkeys[1][:items])

    assert_equal([], monkeys[2][:items])

    assert_equal([], monkeys[3][:items])
  end

  def test_part1
    assert_equal(10_605, @mm.part1)
  end
end
