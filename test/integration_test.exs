defmodule BehavesLike.IntegrationTest do
  use ExUnit.Case, async: true
  @tag timeout: 2 * 60 * 1_000
  @example_root "./example"

  test "external project integration test" do
    IO.puts("\n")
    IO.puts("------- Integration Test -------")
    mix("deps.get", @example_root)
    mix(["dialyzer", "--halt-exit-status"], @example_root)
    IO.puts("-------------------------------")
  end

  defp mix(task, cd) when is_list(task) do
    {_, exit_code} =
      System.cmd("mix", task, cd: cd, env: [{"MIX_ENV", "test"}], into: IO.stream(:stdio, 1))

    assert exit_code == 0
  end

  defp mix(task, cd) do
    mix([task], cd)
  end
end
