defmodule ElhexDelivery.PostalCode.StoreTest do
  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Store

  doctest ElhexDelivery

  test "get_geolocation" do
    Store.start_link
    {latitude, longitide} = Store.get_geolocation("94538")    

    assert is_float(latitude)
    assert is_float(longitide)

  end

end