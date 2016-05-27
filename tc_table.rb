require_relative 'table'
require "test/unit"

class TestTable < Test::Unit::TestCase

  def test_player_hand
    assert_equal(2, Table.new.player_hand.length)
    assert_not_equal(-2..1, Table.new.player_hand.length)

  end
end
