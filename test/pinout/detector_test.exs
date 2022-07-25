defmodule Pinout.DetectorTest do
  use ExUnit.Case

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
      info("grisp2", "GRiSP2"),
      info("mangopi_mq_pro", "MangoPi MQ-Pro")
    ]

    for board_info <- board_infos do
      board_name = Detector.detect(board_info.sysfs)

      assert board_name == board_info.expected_board_name
    end
  end

  test "detecting an unknown board" do
    assert Detector.detect("test/fixture/unknown/sys") == "Unknown Board"
  end
end
