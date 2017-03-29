defmodule ElhexDelivery.PostalCode.Supervisor do
  use Supervisor
  alias ElhexDelivery.PostalCode.{Store, Navigator, Cache}
  

  # @name {:global, ElhexDelivery}

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_name) do
    children = [
      worker(Store, []),
      worker(Navigator, []),
      worker(Cache, [])
    ]



  supervise(children, strategy: :one_for_one)
  end
end