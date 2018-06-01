defmodule Example.Backend do
  @behaviour Example.API

  @impl true
  def get(id) do
    {:ok, {id, :thing}}
  end
end
