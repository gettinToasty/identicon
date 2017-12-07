defmodule Identicon do
  @moduledoc """
    A module that converts a string into a deterministic image.
  """

  def main(input) do
    input
    |> hash_input
  end

  @doc """
  Converts a string input into an MD5 hash, returns an integer list representation

  ## Examples
      iex> Identicon.hash_input("bob")
      [159, 157, 81, 188, 112, 239, 33, 202, 92, 20, 243, 7, 152, 10, 41, 216]
  """
  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
  end
end
