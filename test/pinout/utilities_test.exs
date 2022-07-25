defmodule Pinout.UtilitiesTest do
  use ExUnit.Case

  alias Pinout.Utilities

  doctest Utilities

  test "justification" do
    assert Utilities.justify(9, "Hello", :center) == "  Hello  "
    assert Utilities.justify(9, "Hello", :left) == "Hello    "
    assert Utilities.justify(9, "Hello", :right) == "    Hello"
    assert Utilities.justify(3, "Hello", :left) == "Hello"
  end
end
