defmodule Pinout.Utilities do
  @moduledoc false

  @type justification() :: :left | :center | :right

  @doc """
  Pad a string so that it's left, center, or right justified
  """
  @spec justify(non_neg_integer(), String.t(), justification()) :: String.t()
  def justify(width, string, :left) do
    spaces = max(width - String.length(string), 0)
    string <> String.duplicate(" ", spaces)
  end

  def justify(width, string, :right) do
    spaces = max(width - String.length(string), 0)
    String.duplicate(" ", spaces) <> string
  end

  def justify(width, string, :center) do
    spaces = max(width - String.length(string), 0)
    half_spaces = div(spaces, 2)
    String.duplicate(" ", half_spaces) <> string <> String.duplicate(" ", spaces - half_spaces)
  end

  @spec change_color(Pinout.Board.pin_type()) :: IO.ANSI.ansicode()
  def change_color(:ground), do: :light_black
  def change_color(:p5v), do: :red
  def change_color(:p3v3), do: :yellow
  def change_color(:gpio), do: :green
  def change_color(:i2c), do: :blue
  def change_color(:uart), do: :magenta
  def change_color(:pcm), do: :cyan
  def change_color(:spi), do: :light_magenta
  def change_color(:pwm), do: :light_green
  def change_color(:ain), do: :light_blue
end
