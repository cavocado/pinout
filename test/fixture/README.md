# Device information captures

The subdirectories contain captures of important files for identifying boards
and their GPIO configurations.

To capture data for a new board or to update an existing capture, load
`circuits_quickstart` onto the board (or any other Nerves image). Then `sftp`
to the board and run:

```text
get /proc/cpuinfo
get -R /sys/firmware/devicetree
quit
```

Move the files to subdirectories so they match the device's filesystem layout
and commit.
