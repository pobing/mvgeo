require_relative "geo"
require "test/unit"

class TestGeo < Test::Unit::TestCase

  def test_province_id
    assert_equal('1156110000', Geo.new().province_id('北京') )
    assert_equal('1156110000', Geo.new().province_id('北京市') )
    assert_equal('1156610000', Geo.new().province_id('陕西省') )
    assert_equal(0, Geo.new().province_id('北北京') )
  end

  def test_city_id
    assert_equal('1156610100', Geo.new().city_id('西安') )
    assert_equal('1156610100', Geo.new().city_id('西安市') )
    assert_equal(0, Geo.new().city_id('西京') )
  end

  def test_province_name
    assert_equal('北京市', Geo.new().province_name('1156110000') )
    assert_equal('', Geo.new().province_name('0000000000') )
  end

  def test_city_name
    assert_equal('西安市', Geo.new().city_name('1156610100') )
    assert_not_equal(0, Geo.new().city_name('1156610100') )
  end


end
