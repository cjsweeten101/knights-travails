# frozen_string_literal: true

# Responsible for finding minimum paths on a chess board
class Knight
  attr_accessor :grid_size

  def initialize
    @grid_size = 7
  end

  # Idea: from the starting arr, find all possible moves
  # ie children in graph, push them on to queue
  # and iterate through queue and do the same
  # and make sure to keep track of visited spaces
  def knight_moves(from, to)
    queue = [from]
    visited_spaces [from]
    current_space = nil
    until current_space == to
      current_space queue.shift
      find_next_moves(current_space).each { |m| queue << m }
    end
  end

  # TODO: Find a way to do this cleaner
  def find_next_moves(pos)
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
    p pos
    pos.none? { |element| element > @grid_size || element.negative? }
  end
end
