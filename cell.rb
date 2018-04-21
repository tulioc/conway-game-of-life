class Cell
  attr_accessor :alive, :column_x, :row_y

  def initialize(column_x=0, row_y=0)
    @column_x = column_x
    @row_y = row_y
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
