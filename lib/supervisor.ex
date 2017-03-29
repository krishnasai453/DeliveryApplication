defmodule ElhexDelivery.Supervisor do
  use Supervisor
  

  # @name {:global, ElhexDelivery}

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(ElhexDelivery.PostalCode.Supervisor, [])
    ]

  supervise(children, strategy: :one_for_all)
  end
end