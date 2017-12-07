defmodule Identicon do
  @moduledoc """
    A module that converts a string into a deterministic image.
  """

  def main(input) do
    input
    |> hash_input
    |> determine_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
  end

  @doc """
  Converts a string input into an MD5 hash, returns an integer list representation

  ## Examples
      iex> Identicon.hash_input("bob")
      %Identicon.Image{hex: [159, 157, 81, 188, 112, 239, 33, 202, 92, 20, 243, 7, 152, 10, 41, 216]}
  """
  def hash_input(input) do
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list

    %Identicon.Image{ hex: hex }
  end

  def determine_color(%Identicon.Image{ hex: [r, g, b | _tail] } = image) do
    %Identicon.Image{ image | color: { r, g, b } }
  end

  def build_grid(%Identicon.Image{ hex: hex } = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{ image | grid: grid }
  end

  def mirror_row([a, b | _tail] = row) do
    row ++ [b, a]
  end

  def filter_odd_squares(%Identicon.Image{ grid: grid } = image) do
    grid = Enum.filter grid, fn({ code, _index }) ->
      rem(code, 2) == 0
    end

    %Identicon.Image{ image | grid: grid }
  end

  def build_pixel_map(%Identicon.Image{ grid: grid } = image) do
    
  end
end
