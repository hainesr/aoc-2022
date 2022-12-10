# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class CathodeRayTube < Day
    FRAMEWIDTH = 40

    def setup(input = read_input_file.chomp)
      @code = read_instructions(input)
    end

    def part1
      run_code(@code, [20, 60, 100, 140, 180, 220]).values.sum
    end

    def part2
      framebuffer = fill_framebuffer(@code)
      "\n#{draw_framebuffer(framebuffer)}"
    end

    def run_code(code, collect)
      cycle = 0
      x = 1
      strengths = {}

      code.each do |add|
        cycle += 1
        strengths[cycle] = cycle * x if collect.include?(cycle)

        next if add.zero?

        cycle += 1
        strengths[cycle] = cycle * x if collect.include?(cycle)
        x += add
      end

      strengths
    end

    def fill_framebuffer(code)
      cycle = 0
      x = 1
      row_index = 0
      pixel = ((x + row_index - 1)..(x + row_index + 1))
      framebuffer = Array.new(240, false)

      code.each do |add|
        framebuffer[cycle] = true if pixel.cover?(cycle)
        cycle += 1
        if (cycle % FRAMEWIDTH).zero?
          row_index += FRAMEWIDTH
          pixel = ((x + row_index - 1)..(x + row_index + 1))
        end

        next if add.zero?

        framebuffer[cycle] = true if pixel.cover?(cycle)
        cycle += 1
        x += add
        row_index += FRAMEWIDTH if (cycle % FRAMEWIDTH).zero?
        pixel = ((x + row_index - 1)..(x + row_index + 1))
      end

      framebuffer
    end

    def draw_framebuffer(framebuffer)
      framebuffer.map.with_index do |pixel, i|
        end_scan = ((i + 1) % FRAMEWIDTH).zero? ? "\n" : ''
        pixel ? "##{end_scan}" : ".#{end_scan}"
      end.join
    end

    def read_instructions(input)
      input.each_line(chomp: true).map do |line|
        _, operand = line.split
        operand.nil? ? 0 : operand.to_i
      end
    end
  end
end
