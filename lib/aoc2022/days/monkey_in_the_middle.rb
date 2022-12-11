# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class MonkeyInTheMiddle < Day
    def setup(input = read_input_file.chomp)
      @monkeys = parse_monkeys(input)
    end

    def part1
      20.times do
        round(@monkeys)
      end

      @monkeys.map { _1[:inspected] }.sort[-2..].reduce(&:*)
    end

    def round(monkeys, modulus: false)
      monkeys.length.times do |i|
        monkey_turn(monkeys, i, modulus:)
      end
    end

    def monkey_turn(monkeys, num, modulus: false)
      monkey = monkeys[num]

      monkey[:items].length.times do
        item = monkey[:items].shift
        worry = item.send(monkey[:op][0], monkey[:op][1])

        if modulus
          worry %= modulus
        else
          worry /= 3
        end

        if (worry % monkey[:test]).zero?
          monkeys[monkey[:if_true]][:items] << worry
        else
          monkeys[monkey[:if_false]][:items] << worry
        end

        monkey[:inspected] += 1
      end
    end

    def parse_monkeys(input)
      input.split("\n\n").map do |monkey|
        _, items, op, div, if_true, if_false = monkey.split("\n")
        {
          items: items.split(':')[1].split(',').map(&:to_i),
          op: parse_op(op),
          test: div.split[-1].to_i,
          if_true: if_true[-1].to_i,
          if_false: if_false[-1].to_i,
          inspected: 0
        }
      end
    end

    private

    def parse_op(line)
      op, num = line.split[-2..]

      if num == 'old'
        [:**, 2]
      else
        [op.to_sym, num.to_i]
      end
    end
  end
end
