defmodule Prelude.Test.AllDocsTest do
  use ExSpec, async: true
  doctest Prelude.Atom
  doctest Prelude.List
  doctest Prelude.String
end
