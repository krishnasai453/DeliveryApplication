defmodule ElhexDelivery.PostalCode.DataParserTest do
  use ExUnit.Case

  alias ElhexDelivery.PostalCode.DataParser

  doctest ElhexDelivery

  test "parse_data" do
    geolocation_data = DataParser.parse_data
    {latitude, longitide} = Map.get(geolocation_data, "94538")

    assert is_float(latitude)
    assert is_float(longitide)

  end

end