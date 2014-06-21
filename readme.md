##mvgeo

本文件的省市区代码遵循iso3166标准: http://zh.wikipedia.org/wiki/ISO_3166

功能点：
1.根据省市的 GeoID 获取省市名称
2.根据省市名称获取对应的 GeoID

### Usage:

```
geo = Geo.new

# Get Bejing Geocode
p geo.province_id('北京') # -> 1156110000
p geo.province_id('北京市') # -> 1156110000

p geo.province_name('1156110000') #-> '北京市'

p geo.province_id('美国') # -> 1840000000

p geo.province_id('陕西') # ->1156610000
p geo.city_id('咸阳') # -> 1156610400
p geo.city_name('1156610400') # -> '咸阳市'

# # Not exists id or name
p geo.province_id('北北京') # -> 0
p geo.province_name('asdsd') # -> ''

```