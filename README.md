# PlugIdColumn

Goals:

- To convert the phoenix json responses in array to map

How To use:

- Install the library
- Include in plug in api pipeline
- pass the key used to make array as map in the url as `id_column`. Ex: http://localhost:4000/api/get-some-info?id_column=name (map key is `name`)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `plug_id_column` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:plug_id_column, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/plug_id_column](https://hexdocs.pm/plug_id_column).

