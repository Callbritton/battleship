class Cell
  attr_reader :coordinate, :cell, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @shot_at = false
    @miss = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(boat)
    @ship = boat
  end

  def fired_upon?
    @shot_at
  end

  def fire_upon
    case @ship
    when nil
      @shot_at = true
      @miss = true
    else
      @ship.hit
      @shot_at = true
      @miss = false
    end
  end
end
