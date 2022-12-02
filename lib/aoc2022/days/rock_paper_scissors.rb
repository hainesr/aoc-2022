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

    def setup(input = read_input_file.chomp)
      @rounds = input.split("\n").map { |round| round.split.map(&:to_sym) }
    end

    def part1
      @rounds.map { |round| play_round(round) }.sum
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
  end
end
