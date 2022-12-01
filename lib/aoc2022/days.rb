# frozen_string_literal: true

# Advent of Code 2022
#
# Robert Haines
#
# Public Domain

require 'aoc2022'

# Require all the days' code.
# This is a convenience for the `bin/console` script.
dir = ::File.expand_path('days', __dir__)
::Dir.glob(::File.join(dir, '*.rb'), &method(:require))
