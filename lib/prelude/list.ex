defmodule Prelude.List do
  @moduledoc "Functions operating on `lists`."

  @doc """
  Turns an array into a map with the index as the key.

  Example:

      iex> Prelude.List.indexify(["a", "b"])
      %{0 => "a", 1 => "b"}

      iex> Prelude.List.indexify([6,7,8])
      %{0 => 6, 1 => 7, 2 => 8}
  """
  def indexify(list) when is_list(list) do
    list
    |> Enum.with_index
    |> Enum.map(fn({k, v})-> {v, k} end)
    |> Enum.into(%{})
  end

end
