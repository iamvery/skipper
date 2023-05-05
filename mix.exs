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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
