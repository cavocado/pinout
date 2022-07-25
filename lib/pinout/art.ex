defmodule Pinout.Art do
  @moduledoc false

  alias Pinout.Utilities

  @art %{
    large_rpi:
      {"""
       ╭----------------------------------╮
       |  oooooooooooooooooooo       ╭-----╮
       |  1ooooooooooooooooooo       |     |
       |                             ╰-----╯
       |                             ╭-----╮
       |XXXXXXXXXXXXXXXXXXXXXXXXXXXXX|     |
       |                             ╰-----╯
       |                           ╭-------╮
       |          ╭------╮         |       |
       |  ╭--╮    |      |         ╰-------╯
       ╰--╰--╯----╰------╯-----------------╯
       """, 29},
    small_rpi:
      {"""
       ╭------------------------╮
       |  oooooooooooooooooooo  |
       |  1ooooooooooooooooooo  |
       |XXXXXXXXXXXXXXXXXXXXXXXX|
       |  ╭---╮     ╭--╮  ╭--╮  |
       ╰--╰---╯-----╰--╯--╰--╯--╯
       """, 24},
    rpi_400:
      {"""
       ╭--------------------------------------------------------------------╮
       |  oooooooooooooooooooo      ╭-╮ ╭-╮ ╭--╮ ╭---╮ ╭---╮ ╭---╮ ╭---╮    |
       |  1ooooooooooooooooooo  -o- ╰-╯ ╰-╯ ╰--╯ ╰---╯ ╰---╯ ╰---╯ |   |  - |
       |XXXXXXXXXXXXXXXXXXXXXXXXXXXX                               ╰---╯    |
       ╰--------------------------------------------------------------------╯
       """, 28},
    bbb:
      {"""
       ╭-----------------------------------╮
       |  oooooooooooooooooooooo1 p9 ╭-----╮
       |  ooooooooooooooooooooooo    |     |
       ╭-----╮                       ╰-----╯
       |     |                     ╭-------╮
       ╰-----╯                     |       |
       |XXXXXXXXXXXXXXXXXXXXXXXXXXX╰-------╯
       |                                   |
       |  oooooooooooooooooooooo1 p8       |
       |  ooooooooooooooooooooooo          |
       ╰-----------------------------------╯
       """, 27},
    bbg:
      {"""
       ╭-----------------------------------╮
       |      oooooooooooooooooooooo1 p9   |
       |      ooooooooooooooooooooooo      |
       ╭-----╮                          ╭--╮
       |     |                          |  |
       ╰-----╯                          ╰--╯
       ╭-----╮XXXXXXXXXXXXXXXXXXXXXXXXXX╭--╮
       |     |                          |  |
       ╰-----╯                          ╰--╯
       |      oooooooooooooooooooooo1 p8   |
       |      ooooooooooooooooooooooo      |
       ╰-----------------------------------╯
       """, 26},
    bb_blue:
      {"""
       ╭-----------------------------------╮
       |   a  b  c  d  e             ╭-------╮
       |   f  g  h  i  j             |       |
       |        k  l  m              ╰-------╯
       | n o  oo                           |
       | p q  oo                           |
       |      oo                           |
       |      oo                           |
       |      oo                           |
       | r s  oo                           |
       | t u  oo                       ╭-------╮
       |      oo                       ╰-------╯
       ╰-----------------------------------╯
       """, 27},
    pktb:
      {"""
       ╭--------------------------╮
       |  oooooooooooooooooo p2   |
       |  1ooooooooooooooooo      |
       ╭--╮XXXXXXXXXXXXXXXXXXXXXXX|
       ╰--╯                       |
       |  oooooooooooooooooo p1   |
       |  1ooooooooooooooooo      |
       ╰--------------------------╯
       """, 23},
    seeed:
      {"""
          ╭-------------------------------------╮
          |  ooooooooooooooooooooooo p9       ╭-╮
          |  1oooooooooooooooooooooo          ╰-╯
          |        ╭----------------╮           |
          |        |                |   ╭-------╮
          ╭-----╮  |XXXXXXXXXXXXXXXX|   |       |
          |     |  |                |   ╰-------╯
          ╰-----╯  ╰----------------╯   ╭-------╮
          |  ooooooooooooooooooooooo p8 |       |
          |  1oooooooooooooooooooooo    ╰-------╯
          ╰-------------------------------------╯
       """, 16},
    grisp:
      {"""
       ╭--oooooo--oooooo--oooooo--oooooo--oooooo--╮
       ╭--╮                                       |
       ╰--╯                                       |
       ╭-------╮                                  |
       |       |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|
       ╰-------╯                                  |
       |                                          |
       |                                          |
       ╰------------------------------------------╯
       """, 34},
    unknown: {"XXXXXXXXXXXXX", 13}
  }

  @spec board_art(Pinout.Board.t()) :: String.t()
  def board_art(board) do
    Map.get(@art, board.art_template)
    |> replace(board.board_name)
  end

  defp replace({art, field_width}, name) do
    exes = String.duplicate("X", field_width)
    padded_name = Utilities.justify(field_width, name, :center)
    String.replace(art, exes, padded_name)
  end
end
