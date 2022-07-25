defmodule Pinout.Detector do
  @moduledoc false

  alias Pinout.DB

  @spec detect(Path.t()) :: String.t()
  def detect(sysfs \\ "/sys") do
    case read_model(sysfs) do
      :error ->
        "Unknown Board"

      {:ok, model} ->
        model
        |> String.trim("\0")
        |> DB.lookup_name_by_model()
    end
  end

  defp read_model(sysfs) do
    with {:error, _} <- File.read(Path.join(sysfs, "firmware/devicetree/model")),
         {:error, _} <- File.read(Path.join(sysfs, "firmware/devicetree/base/model")) do
      :error
    end
  end
end
