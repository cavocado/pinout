defmodule Pinout.DB.Boards do
  @moduledoc false

  @unknown_board_name "Unknown Board"
  @unknown_board %Pinout.Board{
    model_name: "unknown",
    art_template: :unknown,
    connectors_key: :unknown,
    board_name: @unknown_board_name
  }

  def unknown_board_name(), do: @unknown_board_name
  def unknown_board(), do: @unknown_board

  @spec boards() :: [Pinout.Board.t()]
  def boards() do
    [
      %Pinout.Board{
        model_name: "Raspberry Pi 3 Model B Rev 1.2",
        art_template: :large_rpi,
        connectors_key: :rpi,
        board_name: "Raspberry Pi 3B"
      },
      %Pinout.Board{
        model_name: "Raspberry Pi 4 Model B Rev 1.1",
        art_template: :large_rpi,
        connectors_key: :rpi,
        board_name: "Raspberry Pi 4B"
      },
      %Pinout.Board{
        model_name: "Raspberry Pi 2 Model B Rev 1.1",
        art_template: :large_rpi,
        connectors_key: :rpi,
        board_name: "Raspberry Pi 2B"
      },
      %Pinout.Board{
        model_name: "Raspberry Pi Zero 2 W Rev 1.0",
        art_template: :small_rpi,
        connectors_key: :rpi,
        board_name: "Raspberry Pi Zero 2 W"
      },
      %Pinout.Board{
        model_name: "Raspberry Pi Zero W Rev 1.1",
        art_template: :small_rpi,
        connectors_key: :rpi,
        board_name: "Raspberry Pi Zero W"
      },
      %Pinout.Board{
        model_name: "TI AM335x PocketBeagle",
        art_template: :pktb,
        connectors_key: :pktb,
        board_name: "PocketBeagle"
      },
      %Pinout.Board{
        model_name: "Raspberry Pi 400 Rev 1.0",
        art_template: :rpi_400,
        connectors_key: :rpi,
        board_name: "Raspberry Pi 400"
      },
      %Pinout.Board{
        model_name: "Seeed i.MX6 ULL NPi Board",
        art_template: :seeed,
        connectors_key: :seeed,
        board_name: "NPi i.MX6 ULL"
      },
      %Pinout.Board{
        model_name: "MangoPi MQ Pro",
        art_template: :small_rpi,
        connectors_key: :mangopi_mq_pro,
        board_name: "MangoPi MQ-Pro"
      },
      # Check
      %Pinout.Board{
        model_name: "GRiSP2",
        art_template: :grisp,
        connectors_key: :unknown,
        board_name: "GRiSP2"
      },
      %Pinout.Board{
        model_name: "TI AM335x BeagleBone Green Wireless",
        art_template: :bbg,
        connectors_key: :bb,
        board_name: "BeagleBone Green Wireless"
      },
      %Pinout.Board{
        model_name: "TI AM335x BeagleBone Black Wireless",
        art_template: :bbb,
        connectors_key: :bb,
        board_name: "BeagleBone Black Wireless"
      },
      %Pinout.Board{
        model_name: "TI AM335x BeagleBone Black",
        art_template: :bbb,
        connectors_key: :bb,
        board_name: "BeagleBone Black"
      },
      # Check
      %Pinout.Board{
        model_name: "TI AM335x BeagleBone Blue",
        art_template: :bb_blue,
        connectors_key: :unknown,
        board_name: "BeagleBone Blue"
      }
    ]
  end
end
