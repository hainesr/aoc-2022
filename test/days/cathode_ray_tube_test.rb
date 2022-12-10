# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/cathode_ray_tube'

class AOC2022::CathodeRayTubeTest < Minitest::Test
  INPUT = <<~EOI
    noop
    addx 3
    addx -5
  EOI

  FRAMEBUFFER = <<~EOF
    ##..##..##..##..##..##..##..##..##..##..
    ###...###...###...###...###...###...###.
    ####....####....####....####....####....
    #####.....#####.....#####.....#####.....
    ######......######......######......####
    #######.......#######.......#######.....
  EOF

  def setup
    @crt = AOC2022::CathodeRayTube.new
  end

  def test_read_instructions
    code = @crt.read_instructions(INPUT)
    assert_equal(0, code[0])
    assert_equal(3, code[1])
    assert_equal(-5, code[2])
  end

  def test_run_code
    code = @crt.read_instructions(BIG_INPUT)
    strengths = @crt.run_code(code, [20, 60, 100, 140, 180, 220])
    assert_equal(
      { 20 => 420, 60 => 1140, 100 => 1800, 140 => 2940, 180 => 2880, 220 => 3960 },
      strengths
    )
  end

  def test_draw_framebuffer
    code = @crt.read_instructions(BIG_INPUT)
    framebuffer = @crt.fill_framebuffer(code)
    assert_equal(FRAMEBUFFER, @crt.draw_framebuffer(framebuffer))
  end

  def test_part1
    @crt.setup(BIG_INPUT)
    assert_equal(13_140, @crt.part1)
  end

  BIG_INPUT = <<~EOBI
    addx 15
    addx -11
    addx 6
    addx -3
    addx 5
    addx -1
    addx -8
    addx 13
    addx 4
    noop
    addx -1
    addx 5
    addx -1
    addx 5
    addx -1
    addx 5
    addx -1
    addx 5
    addx -1
    addx -35
    addx 1
    addx 24
    addx -19
    addx 1
    addx 16
    addx -11
    noop
    noop
    addx 21
    addx -15
    noop
    noop
    addx -3
    addx 9
    addx 1
    addx -3
    addx 8
    addx 1
    addx 5
    noop
    noop
    noop
    noop
    noop
    addx -36
    noop
    addx 1
    addx 7
    noop
    noop
    noop
    addx 2
    addx 6
    noop
    noop
    noop
    noop
    noop
    addx 1
    noop
    noop
    addx 7
    addx 1
    noop
    addx -13
    addx 13
    addx 7
    noop
    addx 1
    addx -33
    noop
    noop
    noop
    addx 2
    noop
    noop
    noop
    addx 8
    noop
    addx -1
    addx 2
    addx 1
    noop
    addx 17
    addx -9
    addx 1
    addx 1
    addx -3
    addx 11
    noop
    noop
    addx 1
    noop
    addx 1
    noop
    noop
    addx -13
    addx -19
    addx 1
    addx 3
    addx 26
    addx -30
    addx 12
    addx -1
    addx 3
    addx 1
    noop
    noop
    noop
    addx -9
    addx 18
    addx 1
    addx 2
    noop
    noop
    addx 9
    noop
    noop
    noop
    addx -1
    addx 2
    addx -37
    addx 1
    addx 3
    noop
    addx 15
    addx -21
    addx 22
    addx -6
    addx 1
    noop
    addx 2
    addx 1
    noop
    addx -10
    noop
    noop
    addx 20
    addx 1
    addx 2
    addx 2
    addx -6
    addx -11
    noop
    noop
    noop
  EOBI
end
