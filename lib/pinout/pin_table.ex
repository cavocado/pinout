defmodule Pinout.PinTable do
  @moduledoc false

  alias Pinout.Utilities

  @spec make(Pinout.Board.t()) :: IO.ANSI.ansidata()
  def make(%Pinout.Board{} = board) do
    connectors = Pinout.DB.get_connectors_by_key(board.connectors_key)

    width = Enum.reduce(connectors, 0, &connector_width/2)
    [header(width, connectors), pins(width, connectors, [])]
  end

  defp connector_width(connector, acc) do
    Enum.reduce(connector, acc, fn {_pin, _type, description}, acc ->
      max(acc, String.length(description))
    end)
  end

  defp header(len, [_, _]) do
    [
      :white,
      Utilities.justify(len + 8, "p9/p1", :right),
      Utilities.justify(len + 4, "", :left),
      :light_black,
      "|",
      :white,
      Utilities.justify(len + 9, "p8/p2", :right),
      Utilities.justify(len + 4, "", :left),
      "\n"
    ]
  end

  defp header(_len, _), do: []

  @spec pins(non_neg_integer(), Pinout.Board.connectors(), IO.ANSI.ansidata()) ::
          IO.ANSI.ansidata()

  # No connectors
  defp pins(_len, [], output), do: output

  # One connector
  defp pins(_len, [[]], output) do
    [output, :default_background]
  end

  defp pins(len, [[pin1, pin2 | rest]], output) do
    new_output = [
      output,
      make_pair(len, pin1, pin2),
      "\n"
    ]

    pins(len, [rest], new_output)
  end

  # Two connectors
  defp pins(_len, [[], []], output) do
    [output, :default_background]
  end

  defp pins(len, [[pin1_p9, pin2_p9 | rest_p9], [pin1_p8, pin2_p8 | rest_p8]], output) do
    new_output = [
      output,
      make_pair(len, pin1_p9, pin2_p9),
      :light_black,
      " | ",
      make_pair(len, pin1_p8, pin2_p8),
      "\n"
    ]

    pins(len, [rest_p9, rest_p8], new_output)
  end

  defp make_pair(len, {num, type, text}, {num2, type2, text2}) do
    [
      Utilities.change_color(type),
      Utilities.justify(len, text, :right),
      :light_black,
      Utilities.justify(5, "[#{num}]", :right),
      " ",
      Utilities.justify(5, "[#{num2}]", :left),
      Utilities.change_color(type2),
      Utilities.justify(len, text2, :left)
    ]
  end
end
