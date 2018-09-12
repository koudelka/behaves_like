defmodule BehavesLike do
  @moduledoc """
  Turns a module's specs into callbacks.

  Lets you state that a module behaves like another, without writing behaviour callbacks.

  For example:
  ```elixir
    defmodule API do
      import BehavesLike, only: [spec_and_callback: 1]

      spec_and_callback get(binary()) :: {:ok, any()} | {:error, any()}
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

  defmacro spec_and_callback(spec) do
    quote do
      @spec unquote(spec)
      @callback unquote(spec)
    end
  end
end
