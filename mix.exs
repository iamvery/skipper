defmodule Skipper.MixProject do
  use Mix.Project

  @description """
  LiveView tests tend to leak details that distract from the system behavior
  you're testing. Skip the noise and let the Skipper patch the leaks so you can
  sail on in your well-tested craft.
  """

  @package [
    files: ["lib", "mix.exs", "README*"],
    maintainers: ["Jay Hayes"],
    licenses: ["MIT"],
    links: %{"GitHub" => "https://github.com/iamvery/skipper"}
  ]

  def project do
    [
      app: :skipper,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      description: @description,
      package: @package,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:floki, "~> 0.34", only: :test},
      {:phoenix_live_view, "~> 0.18", only: :test}
    ]
  end
end
