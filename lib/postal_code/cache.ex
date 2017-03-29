defmodule ElhexDelivery.PostalCode.Cache do
  use GenServer
  alias ElhexDelivery.PostalCode.Navigator

  

  # @name {:global, ElhexDelivery}

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :postal_code_cache)
  end

  def init(_name) do
    state = %{
      distance: %{},
    }
    {:ok, state}
  end

  def set_distance(from, to, distance) do
    GenServer.cast(:postal_code_cache, {:set_distance, from, to, distance})
  end

  def get_distance(from, to) do
    GenServer.call(:postal_code_cache, {:get_distance, from, to})
  end
  @doc """
  Callbacks for server
  """

  def handle_call({:get_distance, from, to}, _from, state) do
    key         = MapSet.new([from, to])
    distance_map = Map.get(state, :distance)
    distance = Map.get(distance_map, key)
    {:reply, distance, state}
  end

  def handle_cast({:set_distance, from, to, distance}, state) do
    key   = generate_key(from, to)
    state = put_in(state, [:distance, key], distance)
    {:noreply, state}
  end


  defp generate_key(from, to) do
    MapSet.new([from, to])
  end
end