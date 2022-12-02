# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class RockPaperScissors < Day
    # My move: [beats, draws, score]
    OUTCOMES = {
      X: [:C, :A, 1],
      Y: [:A, :B, 2],
      Z: [:B, :C, 3]
    }.freeze

    # Their move: [lose, draw, win]
    STRATEGY = {
      A: { X: :Z, Y: :X, Z: :Y },
      B: { X: :X, Y: :Y, Z: :Z },
      C: { X: :Y, Y: :Z, Z: :X }
    }.freeze

    def setup(input = read_input_file.chomp)
      @rounds = input.split("\n").map { |round| round.split.map(&:to_sym) }
    end

    def part1
      @rounds.map { |round| play_round(round) }.sum
    end

    def part2
      @rounds.map { |round| play_round(adjust_strategy(round)) }.sum
    end

    def play_round((them, me))
      win, draw, score = OUTCOMES[me]

      case them
      when win
        6
      when draw
        3
      else
        0
      end + score
    end

    def adjust_strategy((them, me))
      [them, STRATEGY[them][me]]
    end
  end
end
