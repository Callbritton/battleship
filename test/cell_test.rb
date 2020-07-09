require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ships'
require_relative '../lib/cell'

class CellTest < Minitest::Test

  def test_it_has_coordiantes
    cell = Cell.new('B4')

    assert_equal 'B4', cell.coordinate

  end

  def test_cognizant_of_empty?
    cell = Cell.new('B4')

    assert_equal true, cell.empty?

  end


  def test_ship_occupies_cell
      cell = Cell.new('B4')
      cruiser = Ship.new('Crusier', 3)


      assert_equal true, cell.empty?
      cell.place_ship(cruiser)
      assert_equal false, cell.empty?

  end


  def test_it_can_fire
    cell = Cell.new('B4')
    cruiser = Ship.new('Crusier', 3)

    cell.place_ship(cruiser)
    assert_equal 3, cruiser.health
    cell.fire_upon
    assert_equal 2, cruiser.health
  end

  def test_it_knows_if_fired_upon?
    cell = Cell.new('B4')
    cruiser = Ship.new('Crusier', 3)
    cell2 = Cell.new('C4')

    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal true, cell.fired_upon?
  end

  def test_it_renders_default_values
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_1.place_ship(cruiser)
    assert_equal ".", cell_1.render
  end

  def test_it_renders_if_hit
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell_1.place_ship(cruiser)
    cell_1.fire_upon
    assert_equal "H", cell_1.render
  end

  def test_it_renders_if_miss
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end

  def test_it_renders_if_sunk
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell_1.place_ship(cruiser)
    cell_1.fire_upon
    assert_equal false, cruiser.sunk?
    2.times do cell_1.fire_upon end
require "pry"; binding.pry
    assert_equal "X", cell_1.render
    assert_equal true, cruiser.sunk?
  end
  def test_it_can_render_appropriately
    skip
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    #test for miss
    assert_equal ".", cell_1.render
    cell_1.fire_upon
    # assert_equal "S", cell_2.render(false)
    assert_equal "M", cell_1.render

    #test for hit
    assert_equal ".", cell_2.render
    cell_2.place_ship(cruiser)
    assert_equal "S", cell_2.render(true)
    cell_2.fire_upon
    assert_equal "H", cell_1.render

    #test for sunk
    assert_equal false, cruiser.sunk?
    2.times do cell_2.fire_upon end
    assert_equal true, cruiser.sunk?
    assert_equal "X", cell_2.render

  end
end
