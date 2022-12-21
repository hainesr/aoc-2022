# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/monkey_math'

class AOC2022::MonkeyMathTest < Minitest::Test
  INPUT = <<~EOI
    root: pppw + sjmn
    dbpl: 5
    cczh: sllz + lgvd
    zczc: 2
    ptdq: humn - dvpt
    dvpt: 3
    lfqf: 4
    humn: 5
    ljgn: 2
    sjmn: drzm * dbpl
    sllz: 4
    pppw: cczh / lfqf
    lgvd: ljgn * ptdq
    drzm: hmdt - zczc
    hmdt: 32
  EOI

  def setup
    @mm = AOC2022::MonkeyMath.new
  end

  def test_read_math
    assert_equal(
      {
        root: [:pppw, :+, :sjmn],
        dbpl: 5,
        cczh: [:sllz, :+, :lgvd],
        zczc: 2,
        ptdq: [:humn, :-, :dvpt],
        dvpt: 3,
        lfqf: 4,
        humn: 5,
        ljgn: 2,
        sjmn: [:drzm, :*, :dbpl],
        sllz: 4,
        pppw: [:cczh, :/, :lfqf],
        lgvd: [:ljgn, :*, :ptdq],
        drzm: [:hmdt, :-, :zczc],
        hmdt: 32
      },
      @mm.read_math(INPUT)
    )
  end

  def test_part1
    @mm.setup(INPUT)
    assert_equal(152, @mm.part1)
  end

  def test_part2
    @mm.setup(INPUT)
    assert_equal(301, @mm.part2)
  end
end
