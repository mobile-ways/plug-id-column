defmodule PlugIdColumn.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_id_column,
      version: "0.1.3",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "PlugIdColumn",
      source_url: "https://github.com/mobile-ways/plug-id-column.git"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description() do
    "To convert the phoenix json responses in array to map."
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "plug_id_column",
      maintainers: [
        "Kishore Relangi"
      ],
      # These are the default files included in the package
      files: ["lib", "mix.exs", "README*"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mobile-ways/plug-id-column"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:ex_doc, "~> 0.18.0", only: :dev},
      {:poison, "~> 3.1", only: :test}
    ]
  end
end
