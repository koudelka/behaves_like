defmodule BehavesLikeTest do
  use ExUnit.Case, async: true
  doctest BehavesLike

  defmodule SaveCallbacks do
    defmacro __before_compile__(_env) do
      quote do
        def callbacks do
          @callback
        end
      end
    end
  end

  defmodule API do
    use BehavesLike
    @before_compile SaveCallbacks

    @type id :: binary()
    @type result :: any()
    @type error :: any()

    @spec get(id) :: {:ok, result} | {:error, error}
    def get(id) do
      Backend.get(id)
    end
  end

  test "specs to callbacks" do
    assert {:callback,
            {:::, _,
             [
               {:get, _, [{:id, _, nil}]},
               {:|, _, [ok: {:result, _, nil}, error: {:error, _, nil}]}
             ]}, {BehavesLikeTest.API, {1, 2}}} = API.callbacks() |> List.first()
  end
end
