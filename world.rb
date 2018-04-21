require_relative 'cell.rb'

class World
  attr_accessor :rows, :cols, :cell_grid, :cells

  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols
    @cells = []
    @cell_grid = Array.new(rows) do |row|
      Array.new(cols) do |col|
        cell = Cell.new(col, row)
        cells << cell
        cell
      end
    end
  end

  def live_neighbours_around_cell(cell)
    live_neighbours = []
    first_row = 0
    first_column = 0
    actual_row = (cell.row_y)
    actual_column = (cell.column_x)
    row_above = (actual_row - 1)
    row_below = (actual_row + 1)
    right_column = (actual_column + 1)
    left_column = (actual_column - 1)
    last_column = (cols - 1)
    last_row = (rows - 1)

    if actual_row > first_row
      candidate = self.cell_grid[row_above][actual_column]
      live_neighbours << candidate if candidate.alive?
    end

    if actual_row > first_row && actual_column < last_column
      candidate = self.cell_grid[row_above][right_column]
      live_neighbours << candidate if candidate.alive?
    end

    if actual_column < last_column
      candidate = self.cell_grid[actual_row][right_column]
      live_neighbours << candidate if candidate.alive?
    end

    if actual_row < last_row && actual_column < last_column
      candidate = self.cell_grid[row_below][right_column]
      live_neighbours << candidate if candidate.alive?
    end

    if actual_row < last_row
      candidate = self.cell_grid[row_below][actual_column]
      live_neighbours << candidate if candidate.alive?
    end

    if actual_row < last_row && actual_column > first_column
      candidate = self.cell_grid[row_below][left_column]
      live_neighbours << candidate if candidate.alive?
    end

    if actual_column > first_column
      candidate = self.cell_grid[actual_row][left_column]
      live_neighbours << candidate if candidate.alive?
    end

    if actual_row > first_row && actual_column > first_column
      candidate = self.cell_grid[row_above][left_column]
      live_neighbours << candidate if candidate.alive?
    end

    return live_neighbours
  end

  def live_cells
    cells.select {|cell| cell.alive}
  end

  def randomly_populate
    cells.each do |cell|
      cell.alive = [true, false].sample
    end
  end

end
