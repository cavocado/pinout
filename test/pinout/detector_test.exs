defmodule Pinout.DetectorTest do
  use ExUnit.Case

  alias Pinout.DB
  alias Pinout.Detector

  doctest Detector

  defp info(short_name, expected_board_name) do
    %{sysfs: "test/fixture/#{short_name}/sys", expected_board_name: expected_board_name}
  end

  test "detecting all boards" do
    board_infos = [
      info("bb_blue", "BeagleBone Blue"),
      info("bbb", "BeagleBone Black"),
      info("bbbw", "BeagleBone Black Wireless"),
      info("bbgw", "BeagleBone Green Wireless"),
      info("goatmire_badge", "Goatmire Badge"),
      info("grisp2", "GRiSP2"),
      info("mangopi_mq_pro", "MangoPi MQ-Pro"),
      info("nsk", "Nerves Starter Kit")
    ]

    for board_info <- board_infos do
      board_name = Detector.detect(board_info.sysfs)

      assert board_name == board_info.expected_board_name
    end
  end

  test "detecting an unknown board" do
    assert Detector.detect("test/fixture/unknown/sys") == "Unknown Board"
  end

  test "board connector definitions" do
    assert DB.get_connectors_by_key(:unknown) == []

    assert DB.get_connectors_by_key(:nsk) == [
             [
               {1, :ground, "GND"},
               {2, :p3v3, "3.3V"},
               {3, :gpio, "PE2"},
               {4, :gpio, "PE13"},
               {5, :gpio, "PE3"},
               {6, :gpio, "PE11"},
               {7, :gpio, "PE8"},
               {8, :gpio, "PE10"},
               {9, :gpio, "PE9"},
               {10, :gpio, "PE6"},
               {11, :ground, "GND"},
               {12, :gpio, "PE5"},
               {13, :other, "+BATT"},
               {14, :other, "+BATT"}
             ]
           ]
  end
end
