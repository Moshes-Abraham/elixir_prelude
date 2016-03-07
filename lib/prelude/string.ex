defmodule Prelude.String do
  @moduledoc "Functions operating on `strings`."

  @doc """
  Safely convert strings to integers

  Leaves integers alone, and defaults to 0 on error

  Example:
      iex> Prelude.String.to_int("4545")
      4545

      iex> Prelude.String.to_int(4545)
      4545
  """
  def to_int(y) do
    try do
      case y do
        y when is_integer(y) -> y
        y when is_binary(y) -> String.to_integer(y)
        nil -> 0
      end
    rescue
      ArgumentError -> 0
      e -> raise e
    end
  end

  @doc """
  Checks if a string is the string representation of an integer

  Example:
      iex> Prelude.String.is_integer?("34545")
      true

      iex> Prelude.String.is_integer?("a34545")
      false
  """
  def is_integer?(str) do
    case Integer.parse(str) do
      {_, ""} -> true
      _       -> false
    end
  end

  @doc """
  Returns the first code point in the string, or `nil` if str is empty

  Example:
      iex> Prelude.String.head("4545")
      "4"

      iex> Prelude.String.head("")
      nil
  """
  def head(""), do: nil
  def head(str), do: elem(String.next_codepoint(str), 0)

  @doc """
  Chops off the first codepoint, and returns the rest of the string.

  Returns an empty string if `String.length(str) == 1`, and `nil` if string is empty.

  Example:
      iex> Prelude.String.tail("4545")
      "545"

      iex> Prelude.String.tail("")
      nil
  """
  def tail(""), do: nil
  def tail(str), do: elem(String.next_codepoint(str), 1)
end
