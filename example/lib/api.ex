defmodule Example.API do
  import BehavesLike, only: [spec_and_callback: 1]

  @type id :: binary()
  @type result :: Example.Type.t()
  @type error :: any()

  spec_and_callback get(id) :: {:ok, result} | {:error, error}

  def get(id) do
    Example.Backend.get(id)
  end
end
