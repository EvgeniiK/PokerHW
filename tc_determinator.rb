require_relative 'determinator'
require_relative 'table'
require 'test/unit'

class TestDeterminator < Test::Unit::TestCase

  def setup
    @d = Determinator.new

  end

  def test_determinator

    t = Table.new
    d.hashes(t.board)
    assert(d.quads?)
  end
end
