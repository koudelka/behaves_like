defmodule BehavesLike.MixProject do
  use Mix.Project

  @version "0.2.0"

  def project do
    [
      app: :behaves_like,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
      description: "Automatically creates a behaviour from a module's specs.",
      package: package(),
      docs: docs(),
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false}
    ]
  end

  defp dialyzer do
    [
      plt_add_apps: [:ex_unit],
      flags: [
        :race_conditions,
        :no_opaque
      ]
    ]
  end

  defp package do
    [maintainers: ["Michael Shapiro"],
     licenses: ["MIT"],
     links: %{"GitHub": "https://github.com/koudelka/behaves_like"}]
  end

  defp docs do
    [extras: ["README.md"],
     source_url: "https://github.com/koudelka/behaves_like",
     source_ref: @version,
     main: "readme"]
  end
end
