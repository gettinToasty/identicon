defmodule Identicon.Image do
  @moduledoc """
    A data structure that contains the necessary elements to create an identicon from a predetermined string.
  """

  defstruct hex: nil, color: nil, grid: nil, pixel_map: nil
end