# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2022/days/no_space_left_on_device'

class AOC2022::NoSpaceLeftOnDeviceTest < MiniTest::Test
  INPUT = <<~EOI
    $ cd /
    $ ls
    dir a
    14848514 b.txt
    8504156 c.dat
    dir d
    $ cd a
    $ ls
    dir e
    29116 f
    2557 g
    62596 h.lst
    $ cd e
    $ ls
    584 i
    $ cd ..
    $ cd ..
    $ cd d
    $ ls
    4060174 j
    8033020 d.log
    5626152 d.ext
    7214296 k
  EOI

  def setup
    @nslod = AOC2022::NoSpaceLeftOnDevice.new
    @nslod.setup(INPUT)
  end

  def test_tree_size
    tree = @nslod.instance_variable_get(:@tree)
    assert_equal(48_381_165, @nslod.tree_size(tree))
    assert_equal(584, @nslod.tree_size(tree[:dirs]['a'][:dirs]['e']))
    assert_equal(94_853, @nslod.tree_size(tree[:dirs]['a']))
  end

  def test_part1
    assert_equal(95_437, @nslod.part1)
  end

  def test_part2
    assert_equal(24_933_642, @nslod.part2)
  end
end
