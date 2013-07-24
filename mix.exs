defmodule ElixirCasts.Mixfile do
  use Mix.Project

  def project do
    [ app: :elixir_casts,
      version: "0.0.1",
      dynamos: [ElixirCasts.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/elixir_casts/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { ElixirCasts, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" },
      { :apprentice, github: "joeyjoejoejr/apprentice" } ]
  end
end
