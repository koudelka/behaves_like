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
      {_set, bag} = :elixir_module.data_tables(__MODULE__)
      unquote(__MODULE__).get_typespecs(bag, :spec)
      |> Enum.each(&unquote(__MODULE__).store_typespec(bag, :callback, &1))
    end
  end

  @doc false
  def get_typespecs(bag, type) do
    :ets.lookup_element(bag, type, 2)
  end

  @doc false
  def store_typespec(bag, key, value) do
    :ets.insert(bag, {key, value})
    :ok
  end
end
