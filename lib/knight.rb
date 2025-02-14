# frozen_string_literal: true

require 'pry-byebug'

# Responsible for finding minimum paths on a chess board
class Knight
  attr_accessor :grid_size

  def initialize
    @grid_size = 7
  end

  def knight_moves(from, to)
    queue = [from]
    parent = {}
    current_space = nil
    until current_space == to
      current_space = queue.shift
      get_next_moves(current_space).each do |space|
        parent[space] = current_space if parent[space].nil?
        queue << space
      end
    end
    print_path(get_path(from, to, parent))
  end

  def get_path(from, to, parents)
    current_parent = parents[to]
    result = [current_parent]
    until current_parent == from
      current_parent = parents[current_parent]
      result << current_parent
    end
    result.reverse << to
  end

  def print_path(path)
    puts "You made it in #{path.size - 1} moves! Here's your path:"
    path.each do |pos|
      p pos
    end
  end

  # TODO: Find a way to do this cleaner
  def get_next_moves(pos)
    result = []

    result << [pos[0] + 2, pos[1] + 1] if valid?([pos[0] + 2, pos[1] + 1])
    result << [pos[0] + 1, pos[1] + 2] if valid?([pos[0] + 1, pos[1] + 2])
    result << [pos[0] + 1, pos[1] - 2] if valid?([pos[0] + 1, pos[1] - 2])
    result << [pos[0] + 2, pos[1] - 1] if valid?([pos[0] + 2, pos[1] - 1])
    result << [pos[0] - 2, pos[1] + 1] if valid?([pos[0] - 2, pos[1] + 1])
    result << [pos[0] - 1, pos[1] + 2] if valid?([pos[0] - 1, pos[1] + 2])
    result << [pos[0] - 1, pos[1] - 2] if valid?([pos[0] - 1, pos[1] - 2])
    result << [pos[0] - 2, pos[1] - 1] if valid?([pos[0] - 2, pos[1] - 1])
    result
  end

  def valid?(pos)
    pos.none? { |element| element > @grid_size || element.negative? }
  end
end
