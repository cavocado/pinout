defmodule Pinout.Board do
  @moduledoc false

  @type pin_type() :: :ain | :gnd | :gpio | :i2c | :p3v3 | :p5v | :pcm | :pwm | :spi | :uart
  @type pin_info() :: {non_neg_integer(), pin_type(), String.t()}
  @type connector() :: [pin_info()]
  @type connectors() :: [connector()]

  defstruct [:model_name, :art_template, :connectors_key, :board_name]

  @type t() :: %__MODULE__{
          model_name: String.t() | Regex.t(),
          art_template: atom(),
          connectors_key: atom(),
          board_name: String.t()
        }
end
