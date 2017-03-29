defmodule ElhexDelivery.PostalCode.CacheTest do
  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Cache

  doctest ElhexDelivery

  test "get_and_set_distance" do
  	point1            = "12345"
  	point2            = "98765"
  	distance          = 99.98
  	set_distance      = Cache.set_distance(point1, point2, distance)
  	retrived_distance = Cache.get_distance(point1, point2)
  	assert distance  == retrived_distance
  end
end
