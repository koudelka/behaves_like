defmodule BehavesLike do
  @moduledoc """
  Turns a module's specs into callbacks.

  Lets you state that a module behaves like another, without writing behaviour callbacks.

  For example:
  ```elixir
    defmodule API do
      use BehavesLike

      @spec get(binary()) :: {:ok, any()} | {:error, any()}
      def get(id) do
        Backend.get(id)
      end
    end

    defmodule Backend do
      @behaviour API

      @impl true
      def get(id) do
        database().get(id)
      end
    end
  ```
  """

  defmacro __using__(_opts) do
    quote do
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      Enum.map(@spec, fn {:spec, spec, _position} ->
        Module.eval_quoted(__MODULE__, quote(do: @callback(unquote(spec))))
      end)
    end
  end
end
