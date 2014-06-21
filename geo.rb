#encoding: utf-8
require 'json'

class Geo
  def initialize
    load_data
  end

  # Given a province name get provicne's geoid
  # @province_name support format `xx省`  or  `xx` 陕西省，陕西
  def province_id province_name
    province_id = 0
    @data.each do |pro|
      province_id = pro.first[0] if pro.first[1].include?(province_name)
    end

    province_id
  end

  # Given province geo id get province'name
  def province_name pro_geo_id
    province_name = ''
    @data.each do |pro|
      province_name = pro.first[1] if pro.first[0] == pro_geo_id
    end

    province_name
  end

  # Given a city name get city's geoid
  def city_id city_name
    city_id = 0
    @data.each do |pro|
      citys = pro['citys'] || []
      citys.each do |c|
        city_id =  c.first[0] if c.first[1].include?(city_name)
      end
    end
    city_id
  end

  # Given city geo id get city'name
  # @city_name support format `xx市`  or  `xx` eg: 西安市 ,西安
  def city_name city_geo_id
    city_name = ''
    @data.each do |pro|
      citys = pro['citys'] || []
      citys.each do |c|
        city_name =  c.first[1] if c.first[0] == city_geo_id
      end
    end
    city_name
  end

  private

  # load geo json file
  def load_data
    geo_json_path = "lib/geo.json"
    @data = []
    File.open(geo_json_path) do |f|
      @data = JSON.load(f)
    end
    raise "Parse error: #{geo_json_path}" if @data == []
  end
end


# Usage:

# geo = Geo.new

# # Get Bejing Geocode
# p geo.province_id('北京') # -> 1156110000
# p geo.province_id('北京市') # -> 1156110000

# p geo.province_name('1156110000') #-> '北京市'

# p geo.province_id('美国') # -> 1840000000

# p geo.province_id('陕西') # ->1156610000
# p geo.city_id('咸阳') # -> 1156610400
# p geo.city_name('1156610400') # -> '咸阳市'

# # Not exists id or name
# p geo.province_id('北北京') # -> 0
# p geo.province_name('asdsd') # -> ''
