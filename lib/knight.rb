# frozen_string_literal: true

# Responsible for finding minimum paths on a chess board
class Knight
  attr_accessor :grid_size, :moves

  def initialize
    @grid_size = 7
    @moves = [[1, 2], [2, 1], [1, -2], [-1, 2], [-2, 1], [2, -1], [-2, -1], [-1, -2]]
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

  def get_next_moves(pos)
    result = []

    moves.each do |x, y|
      new_pos = [pos[0] + x, pos[1] + y]
      result << new_pos if valid?(new_pos)
    end
    result
  end

  def valid?(pos)
    pos.none? { |element| element > @grid_size || element.negative? }
  end
end
