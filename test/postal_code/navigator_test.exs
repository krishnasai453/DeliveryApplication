defmodule ElhexDelivery.PostalCode.NavigatorTest do
  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Navigator

  doctest ElhexDelivery

  describe "get_distance" do
    test "postal code strings" do
      distance = Navigator.get_distance("94538", "94111")
      assert is_float(distance)
    end
    test "postal code integer" do
      distance = Navigator.get_distance(94538, 94111)
      assert is_float(distance)
    end
    test "postal code strings and integers" do
      distance = Navigator.get_distance(94538, "94111")
      assert is_float(distance)
    end
    @tag :capture_log
    test "postal code unexpected format" do
      navigator_pid = Process.whereis(:postal_code_navigator)
      reference = Process.monitor(navigator_pid)
      catch_exit do
        Navigator.get_distance("94538", 94111.021)
      end
      assert_received({:DOWN, ^reference, :process, ^navigator_pid, {%ArgumentError{}, _}})
  end
end

  describe "get_distance(actual_place)" do
    test "distance_between_rwc_and_sf" do
      #Redwood City, CA 94062
      #San Francisco, CA 94104
      #Driving Distance ~ 40 miles
      distance = Navigator.get_distance("94062", "94104")
      assert distance == 26.75
    end
    test "distance_between_sf_and_nyc" do
      #San Francisco, CA 94104
      #New York, NY 10112
      #Driving Distance ~ 3100 miles
      distance = Navigator.get_distance(94104, 10112)
      assert distance == 2565.28
    end
    test "distance_between_rwc_and_sf and integers" do
      # Minneapolis, MN 55401
      # Austin, TX 78703
      #Driving Distance ~ 1100 miles
      distance = Navigator.get_distance(55401, 78703)
      assert distance == 1044.08
    end

  end
end