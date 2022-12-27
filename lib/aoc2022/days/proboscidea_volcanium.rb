# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'
require_relative '../common/floyd_warshall'

module AOC2022
  class ProboscideaVolcanium < Day
    ROOT_NODE = 'AA'

    def setup(input = read_input_file.chomp)
      map, @rates = read_map(input)
      @map = process_map(map, @rates)
    end

    def part1
      find_paths(@map, @rates, 30).last.max
    end

    def part2 # rubocop:disable Metrics/AbcSize
      paths, pressures = find_paths(@map, @rates, 26)
      paths = paths.zip(pressures).sort_by(&:last).reverse

      i = 1
      i += 1 while paths[i][0].any? { paths[0][0].include?(_1) }

      max = paths[0][1] + paths[i][1]

      (1..i).each do |x|
        ((x + 1)..(i + 1)).each do |y|
          next if paths[y][0].any? { paths[x][0].include?(_1) }

          max = [max, (paths[x][1] + paths[y][1])].max
        end
      end

      max
    end

    def find_paths(map, rates, time)
      pressures = []
      paths = []
      stack = [[time, 0, [ROOT_NODE]]]

      until stack.empty?
        t, pres, path = stack.pop
        current_pos = path[-1]
        new_path = []

        map[current_pos].each do |node, distance|
          next if distance > t - 1 || path.include?(node)

          nt = t - distance - 1
          npres = pres + (rates[node] * nt)
          new_path << [nt, npres, path + [node]]
        end

        if new_path.empty?
          pressures << pres
          paths << path[1..]
        else
          stack += new_path
        end
      end

      [paths, pressures]
    end

    def process_map(map, rates)
      distances = Common::FloydWarshall.solve(map.keys, map)
      nodes = [ROOT_NODE] + map.keys.select { rates[_1].positive? }

      {}.tap do |new_map|
        nodes.each do |node|
          new_map[node] = distances[node].select { nodes.include?(_1) }
        end
      end
    end

    def read_map(input)
      [{}, {}].tap do |(map, rates)|
        input.each_line(chomp: true) do |line|
          valve, neighbours = line.split(/; tunnels? leads? to valves? /)
          _, rate = valve.split('=').map(&:to_i)

          map[valve[6..7]] = neighbours.split(', ').map { [_1, 1] }.to_h
          rates[valve[6..7]] = rate
        end
      end
    end
  end
end
