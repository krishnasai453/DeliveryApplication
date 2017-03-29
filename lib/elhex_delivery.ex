defmodule ElhexDelivery do
  use Application

  def start(_type, args) do
    ElhexDelivery.Supervisor.start_link
  end

end
