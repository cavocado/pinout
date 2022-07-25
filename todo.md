


Pinout.pinout() ✓
  - detect and then print pinout

Pinout.pinout(board_name) ✓
   - print pinout of the specified board?

Pinout.known_boards() ✓
   - return list of known boards

Pinout.pinout_ansidata() ✓
   - return ansidata for the pinout of current board

Pinout.pinout_ansidata(board_name) ✓
   - return ansidata for the pinout of the board_name

Pinout.detect() ✓
   - return the board that you're running on


## Other modules

Detector
    - detects the current board ✓
    - detect(sysfs_path \\ "/sys") ✓
    - change with statement

Board
    - struct with info for a board? ✓
    - info has: art_template, board_name, pins, model_name ✓

Art
    - board_art(board) ✓

DB
    - has a big map of all the boards and their infos ✓
    - lookup_by_model(name) ✓

PinTable
    - make(board) ✓
