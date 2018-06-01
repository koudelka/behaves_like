defmodule Example.API do
  use BehavesLike

  @type id :: binary()
  @type result :: any()
  @type error :: any()

  @spec get(id) :: {:ok, result} | {:error, error}
  def get(id) do
    Example.Backend.get(id)
  end
end
