# Elixir Prelude

[![Build status](https://travis-ci.org/ruby2elixir/elixir_prelude.svg "Build status")](https://travis-ci.org/ruby2elixir/elixir_prelude)
[![Hex version](https://img.shields.io/hexpm/v/elixir_prelude.svg "Hex version")](https://hex.pm/packages/elixir_prelude)
![Hex downloads](https://img.shields.io/hexpm/dt/elixir_prelude.svg "Hex downloads")

Small set of useful utility functions.

Forked to release on Hex.pm, see: https://github.com/houshuang/elixir-prelude/issues/1


## Installation

1. Add `elixir_prelude` to your list of dependencies in `mix.exs`:
```elixir
def deps do
  [{:elixir_prelude, "~> 0.2"}]
end
```

## Usage

The most useful utility is provided by Prelude.Map to work with deeply nested Maps or Structs.


```elixir
defmodule Data do
  defstruct data: %{}
end

Prelude.Map.deep_put(%Data{}, [:data, :b, :c, :d], 2)
#=> %Data{data: %{b: %{c: %{d: 2}}}}

Prelude.Map.deep_get(%Data{data: %{b: %{c: %{d: 2}}}}, [:data, :b, :c, :d])
#=> 2

Prelude.Map.del_in(%Data{data: %{b: %{c: %{d: 2}}}}, [:data, :b, :c, :d])
#=> %Data{data: %{b: %{c: %{}}}}
```

Other modules:
  - Prelude.Atom
  - Prelude.List
  - Prelude.String



This package has a set of functions that I extracted from projects I worked on (mainly [this](https://github.com/houshuang/survey)). Some are very trivial, others (especially in the Prelude.Map module) are more involved. I am mainly putting it together for my own future reuse, but some of it might be useful to others. I would like to add tests, and I will keep adding functions as they come up. Pull requests or suggestions for new functions, better APIs etc are welcome (tests would be awesome).

Stian Håklev, shaklev@gmail.com, http://reganmian.net


See CHANGELOG.md for progress.
