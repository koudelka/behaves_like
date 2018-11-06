defmodule ExampleTest do
  use ExUnit.Case

  test "specs to callbacks" do
    assert {:ok,
            [
              {{:get, 1},
               [
                 {:type, 8, :fun,
                  [
                    {:type, 8, :product, [{:user_type, 8, :id, []}]},
                    {:type, 8, :union,
                     [
                       {:type, 0, :tuple, [{:atom, 0, :ok}, {:user_type, 8, :result, []}]},
                       {:type, 0, :tuple, [{:atom, 0, :error}, {:user_type, 8, :error, []}]}
                     ]}
                  ]}
               ]}
            ]} = Code.Typespec.fetch_callbacks(Example.API)
  end
end
