defmodule Pinout do
  @moduledoc """
  """

  alias Pinout.Detector
  alias Pinout.DB
  alias Pinout.Art
  alias Pinout.PinTable

  @doc """
  Prints the pinout for the current board

  ## Examples

      #=> Pinout.print()
      ╭------------------------╮
      |  oooooooooooooooooooo  |
      |  1ooooooooooooooooooo  |
      |  Raspberry Pi Zero W   |
      |  ╭---╮     ╭--╮  ╭--╮  |
      ╰--╰---╯-----╰--╯--╰--╯--╯
               3v3 Power  [1] [2]  5v Power
         GPIO 2/I2C1 SDA  [3] [4]  5v Power
         GPIO 3/I2C1 SCL  [5] [6]  Ground
           GPIO 4/GPCLK0  [7] [8]  GPIO 14/UART TX
                  Ground  [9] [10] GPIO 15/UART RX
                 GPIO 17 [11] [12] GPIO 18/PCM CLK
                 GPIO 27 [13] [14] Ground
                 GPIO 22 [15] [16] GPIO 23
               3v3 Power [17] [18] GPIO 24
       GPIO 10/SPI0 MOSI [19] [20] Ground
        GPIO 9/SPI0 MISO [21] [22] GPIO 25
       GPIO 11/SPI0 SCLK [23] [24] GPIO 8/SPI0 CE0
                  Ground [25] [26] GPIO 7/SPI0 CE1
       GPIO 0/EEPROM SDA [27] [28] GPIO 1/EEPROM SCL
                  GPIO 5 [29] [30] Ground
                  GPIO 6 [31] [32] GPIO 12/PWM0
            GPIO 13/PWN1 [33] [34] Ground
          GPIO 19/PCM FS [35] [36] GPIO 16
                 GPIO 26 [37] [38] GPIO 20/PCM DIN
                  Ground [39] [40] GPIO 21/PCM DOUT
  """
  @spec print() :: :ok
  def print() do
    pinout_content()
    |> IO.ANSI.format()
    |> IO.puts()
  end

  @doc """
  Print out the pinout for a specific board

  Call `Pinout.known_boards/0` for a list of boards

  ## Examples

      #=> Pinout.print("Raspberry Pi 4B")
      ╭----------------------------------╮
      |  oooooooooooooooooooo       ╭-----╮
      |  1ooooooooooooooooooo       |     |
      |                             ╰-----╯
      |                             ╭-----╮
      |       Raspberry Pi 4B       |     |
      |                             ╰-----╯
      |                           ╭-------╮
      |          ╭------╮         |       |
      |  ╭--╮    |      |         ╰-------╯
      ╰--╰--╯----╰------╯-----------------╯
              3v3 Power  [1] [2]  5v Power
        GPIO 2/I2C1 SDA  [3] [4]  5v Power
        GPIO 3/I2C1 SCL  [5] [6]  Ground
          GPIO 4/GPCLK0  [7] [8]  GPIO 14/UART TX
                 Ground  [9] [10] GPIO 15/UART RX
                GPIO 17 [11] [12] GPIO 18/PCM CLK
                GPIO 27 [13] [14] Ground
                GPIO 22 [15] [16] GPIO 23
              3v3 Power [17] [18] GPIO 24
      GPIO 10/SPI0 MOSI [19] [20] Ground
      GPIO 9/SPI0 MISO  [21] [22] GPIO 25
      GPIO 11/SPI0 SCLK [23] [24] GPIO 8/SPI0 CE0
                 Ground [25] [26] GPIO 7/SPI0 CE1
      GPIO 0/EEPROM SDA [27] [28] GPIO 1/EEPROM SCL
                 GPIO 5 [29] [30] Ground
                 GPIO 6 [31] [32] GPIO 12/PWM0
           GPIO 13/PWN1 [33] [34] Ground
         GPIO 19/PCM FS [35] [36] GPIO 16
                GPIO 26 [37] [38] GPIO 20/PCM DIN
                 Ground [39] [40] GPIO 21/PCM DOUT
  """
  @spec print(String.t()) :: :ok
  def print(name) do
    pinout_content(name)
    |> IO.ANSI.format()
    |> IO.puts()
  end

  @doc """
  Get a list of boards known to the Pinout library

  ## Examples

      iex> Pinout.known_boards()
      ["Raspberry Pi 3B", "Raspberry Pi 4B", "Raspberry Pi 2B",
      "Raspberry Pi Zero 2 W", "Raspberry Pi Zero W", "PocketBeagle",
      "Raspberry Pi 400", "NPi i.MX6 ULL", "MangoPi MQ-Pro", "GRiSP2",
      "BeagleBone Green Wireless", "BeagleBone Black Wireless", "BeagleBone Black",
      "BeagleBone Blue"]

  """
  @spec known_boards() :: [String.t()]
  def known_boards() do
    DB.get_board_names()
  end

  @doc """
  Return the pinout as IO.ANSI.ansidata

  If you'd like to use the pinout information and not print it to the terminal,
  call this function to get the raw ansidata version of it. To convert this to
  a string, call `IO.ANSI.format/1` and then pass the result to
  `IO.chardata_to_string/1`.
  """
  @spec pinout_content() :: IO.ANSI.ansidata()
  def pinout_content() do
    board = detect() |> DB.lookup_by_name()

    [Art.board_art(board), PinTable.make(board)]
  end

  @doc """
  Returns the pinout for a specific board as IO.ANSI.ansidata
  """
  @spec pinout_content(String.t()) :: IO.ANSI.ansidata()
  def pinout_content(name) do
    board = DB.lookup_by_name(name)

    [Art.board_art(board), PinTable.make(board)]
  end

  @doc """
  Return the name of the current board
  """
  @spec detect() :: String.t()
  defdelegate detect(), to: Detector
end
