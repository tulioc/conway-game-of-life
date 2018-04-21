require_relative 'cell.rb'

class World
  attr_accessor :rows, :cols, :cell_grid, :cells, :first_row, :first_column,
  :last_row, :last_column

  def initialize(rows=3, cols=3)
    @first_row = 0
    @first_column = 0
    @rows = rows
    @cols = cols
    @last_row = (@rows - 1)
    @last_column = (@cols -1)
    @cells = []
    @cell_grid = Array.new(rows) do |row|
      Array.new(cols) do |col|
        cell = Cell.new(col, row)
        cells << cell
        cell
      end
    end
  end

  def check_north_neighbour(live_neighbours, cell)
    if cell.current_row > @first_row
      neighbour = self.cell_grid[cell.row_above][cell.current_column]
      live_neighbours << neighbour if neighbour.alive?
    end
  end

  def check_north_east_neighbour(live_neighbours, cell)
    if cell.current_row > @first_row && cell.current_column < @last_column
      neighbour = self.cell_grid[cell.row_above][cell.right_column]
      live_neighbours << neighbour if neighbour.alive?
    end
  end

  def check_east_neighbour(live_neighbours, cell)
    if cell.current_column < @last_column
      neighbour = self.cell_grid[cell.current_row][cell.right_column]
      live_neighbours << neighbour if neighbour.alive?
    end
  end

  def check_south_east_neighbour(live_neighbours, cell)
    if cell.current_row < @last_row && cell.current_column < @last_column
      neighbour = self.cell_grid[cell.row_below][cell.right_column]
      live_neighbours << neighbour if neighbour.alive?
    end
  end

  def check_south_neighbour(live_neighbours, cell)
    if cell.current_row < @last_row
      neighbour = self.cell_grid[cell.row_below][cell.current_column]
      live_neighbours << neighbour if neighbour.alive?
    end
  end

  def check_south_west_neighbour(live_neighbours, cell)
    if cell.current_row < @last_row && cell.current_column > @first_column
      neighbour = self.cell_grid[cell.row_below][cell.left_column]
      live_neighbours << neighbour if neighbour.alive?
    end
  end

  def check_west_neighbour(live_neighbours, cell)
    if cell.current_column > @first_column
      neighbour = self.cell_grid[cell.current_row][cell.left_column]
      live_neighbours << neighbour if neighbour.alive?
    end
  end

  def check_north_west_neighbour(live_neighbours, cell)
    if cell.current_row > @first_row && cell.current_column > @first_column
      neighbour = self.cell_grid[cell.row_above][cell.left_column]
      live_neighbours << neighbour if neighbour.alive?
    end
  end


  def live_neighbours_around_cell(cell)
    live_neighbours = []

    check_north_neighbour(live_neighbours, cell)
    check_north_east_neighbour(live_neighbours, cell)
    check_east_neighbour(live_neighbours, cell)
    check_south_east_neighbour(live_neighbours, cell)
    check_south_neighbour(live_neighbours, cell)
    check_south_west_neighbour(live_neighbours, cell)
    check_west_neighbour(live_neighbours, cell)
    check_north_west_neighbour(live_neighbours, cell)

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
