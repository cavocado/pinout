# Pinout

[![CircleCI](https://circleci.com/gh/cavocado/pinout.svg?style=svg)](https://circleci.com/gh/cavocado/pinout)
[![Hex version](https://img.shields.io/hexpm/v/pinout.svg "Hex version")](https://hex.pm/packages/pinout)

Pinout detects popular embedded devices and prints out pinout diagrams.

## Usage

Add `pinout` to your project's dependency list:

```elixir
def deps do
  [
    {:pinout, "~> 0.1"}
  ]
end
```

Build and then run `Pinout.print()` at the IEx prompt.

## Adding new boards

To add support for a new board, do the following:

1. Copy `/sys/firmware/devicetree/base` directory off the new board and add it
   under the `test/fixture` directory like other boards.
   a. This can be accomplished with a command like
      `scp -R nerves.local:/sys/firmware/devicetree/base .`
2. Find a board in `lib/pinout/db/boards.ex` that's similar to the new one and
   use it as a template for the new board.
3. If the new board has a new pinout, add the pinout information to
   `lib/pinout/db/connectors.ex`
4. Finally, if the board needs new artwork, add the new ASCII art to
   `lib/pinout/art.ex`
5. Send a PR! :)

## License

Copyright (C) 2022 Alexa Hunleth

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

