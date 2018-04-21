class Cell
  attr_accessor :alive, :current_column, :left_column, :right_column,
                :current_row, :row_above, :row_below

  def initialize(current_column=0, current_row=0)
    @current_column = current_column
    @left_column = (@current_column - 1)
    @right_column = (@current_column + 1)
    @current_row = current_row
    @row_above = (@current_row - 1)
    @row_below = (@current_row + 1)
    @alive = false
  end

  def alive?
    alive
  end

  def dead?
    !alive
  end

  def die!
    @alive = false
  end

  def revive!
    @alive = true
  end
end
