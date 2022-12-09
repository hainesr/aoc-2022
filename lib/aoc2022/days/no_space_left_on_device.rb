# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

module AOC2022
  class NoSpaceLeftOnDevice < Day
    def setup(input = read_input_file.chomp)
      @tree = read_tree(input)
    end

    def part1
      all_dirs(@tree).reduce(0) do |acc, dir|
        size = tree_size(dir)
        size <= 100_000 ? acc + size : acc
      end
    end

    def all_dirs(tree, dirs = [tree])
      tree[:dirs].each do |_, dir|
        dirs << dir
        all_dirs(dir, dirs)
      end

      dirs
    end

    def tree_size(tree)
      tree[:files].values.sum + tree[:dirs].sum { |_, v| tree_size(v) }
    end

    def read_tree(input)
      root_dir = { parent: nil, dirs: {}, files: {} }
      current_dir = nil

      input.each_line(chomp: true) do |line|
        if line.start_with?('$ cd')
          name = line[5..]

          current_dir =
            case name
            when '..'
              current_dir[:parent]
            when '/'
              root_dir
            else
              current_dir[:dirs][name]
            end
        else
          next if line == '$ ls'

          if line.start_with?('dir')
            current_dir[:dirs][line[4..]] ||= {
              parent: current_dir,
              dirs: {},
              files: {}
            }
          else
            size, name = line.split
            current_dir[:files][name] = size.to_i
          end
        end
      end

      root_dir
    end
  end
end
