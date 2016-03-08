defmodule Prelude.Mixfile do
  use Mix.Project

  @version "0.2.1"
  def project do
    [app: :elixir_prelude,
      version: @version,
      name: "Elixir Prelude",
      source_url: "https://github.com/ruby2elixir/elixir_prelude",
      elixir: "~> 1.0",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package,
      docs: [extras: ["README.md", "CHANGELOG.md"]],
      deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:ex_spec, "~> 1.0", only: :test},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.8", only: :dev}
    ]
  end

  defp package do
    [
     maintainers: ["Stian Håklev", "Roman Heinrich"],
     licenses: ["MIT License"],
     description: "Small set of useful utility functions",
     links: %{
       github: "https://github.com/ruby2elixir/elixir_prelude",
       docs: "http://hexdocs.pm/elixir_prelude/#{@version}/"
     }
    ]
  end
end
