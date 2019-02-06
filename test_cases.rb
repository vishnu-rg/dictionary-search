require_relative "icicle_assignment"
require "test/unit"
 
class TestCase < Test::Unit::TestCase
 
  def test_case
    assert_equal(true, output(999).include?("zzz") )
    assert_equal(true, output(6686787825).include?("motortruck") )
    assert_equal(false, output(2686787825).include?("motortruck") )
    assert_equal(false, output(9999992222).include?(["zzz", "zzz", "aa", "aa"]) )
    assert_equal(true, output(9999992222).include?(["zzz", "zzz", "caca"]) )
    assert_equal(true, output(5555555555).count.zero? )
  end
 
end