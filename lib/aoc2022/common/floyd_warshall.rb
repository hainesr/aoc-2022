# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

module AOC2022
  module Common
    module FloydWarshall
      module_function

      def solve(nodes, neighbours)
        dist = Hash.new do |h, k|
          h[k] = Hash.new { |hh, kk| hh[kk] = Float::INFINITY }
        end

        nodes.each do |node|
          dist[node][node] = 0

          neighbours[node].each do |n, weight|
            dist[node][n] = weight
          end
        end

        nodes.each do |k| # rubocop:disable Style/CombinableLoops
          nodes.each do |j|
            nodes.each do |i|
              route = dist[i][k] + dist[k][j]
              dist[i][j] = route if route < dist[i][j]
            end
          end
        end

        dist
      end
    end
  end
end
