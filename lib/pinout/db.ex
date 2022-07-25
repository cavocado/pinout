defmodule Pinout.DB do
  @moduledoc false

  alias Pinout.DB.Boards
  alias Pinout.DB.Connectors

  @spec get_connectors_by_key(atom()) :: Pinout.Board.connectors()
  def get_connectors_by_key(key) do
    Map.fetch!(Connectors.connector_map(), key)
  end

  @spec lookup_name_by_model(String.t()) :: String.t()
  def lookup_name_by_model(model) do
    Enum.find_value(Boards.boards(), Boards.unknown_board_name(), fn x ->
      if x.model_name == model do
        x.board_name
      end
    end)
  end

  @spec lookup_by_name(String.t()) :: Pinout.Board.t()
  def lookup_by_name(name) do
    Enum.find(Boards.boards(), Boards.unknown_board(), fn x -> x.board_name == name end)
  end

  @spec get_board_names() :: [String.t()]
  def get_board_names() do
    Enum.map(Boards.boards(), fn x -> x.board_name end)
  end
end
