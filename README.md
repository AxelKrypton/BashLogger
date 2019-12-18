# A Bash Logger

Often, implementing less-than-minimal bash scripts, it would be nice to have different output levels (for information, warnings, errors, etc.) as well as a unified style to print messages to the user.
This need made me implement this logger, which serves for this purpose.
Since I like colorful output, a different color was assigned to each level and your terminal should support 256-colors, which you can simply check trying the following command.

```bash
printf '\n\e[1;38;5;202;48;5;11m Is this bold orange on yellow background? \e[0m\n\n'
```

If no strange symbols are displayed and you see colors, than you are in a good shape to use the logger! :smile:  
If strange symbols appears, have a look to [this however not fully comprehensive list](https://misc.flogisoft.com/bash/tip_colors_and_formatting#terminals_compatibility) to check out which terminals support 256-colors.

## How to use it

This logger has been implemented with the aim to provide functionality once sourced in another script.
Therefore, it simply contains a bunch of functions which become available into your script, once the logger has been sourced.

1. Source the logger in your script via `source /path/to/Logger.bash` or via `. /path/to/Logger.bash`.
1. Use either of the provided functions when you wish to print something to the user:
   * `PrintTrace`
   * `PrintDebug`
   * `PrintInfo`
   * `PrintAttention`
   * `PrintWarning`
   * `PrintError`
   * `PrintFatalAndExit`
   * `PrintInternalAndExit`
1. Each function must be followed by at least one argument.
   Each argument is printed to the fd 3 (which duplicates the standard output at the beginning) on a new line, prepending to the first argument the level label.
1. You can pass either of the following command-line argument to each function to slightly change its behaviour.
   In this case separate the message from the options via `--`.
   * `-l` &ensp; :arrow_right: &ensp; to suppress label printing (space is printed instead)
   * `-n` &ensp; :arrow_right: &ensp; to suppress last endline (useful e.g. to ask interactive question to user)
   * `-d` &ensp; :arrow_right: &ensp; to avoid restoring default color and font at the end.
   * `--` &ensp; :arrow_right: &ensp; to separate options from message
   
   For example, `PrintInfo -l -- "Hello world!"` will print the message in green with some space in front, but without label.
1. The output levels have an internal hierarchy and it is possible to choose what to print.
   Use the `VERBOSE` environment variable when running your script to activate or suppress the output level printing.

   | VERBOSE | Levels that are printed |
   | :-----: | :---------------------- |
   | `INTERNAL`         | Internal, Fatal |
   | `0` or `FATAL`     | Internal, Fatal |
   | `1` or `ERROR`     | Internal, Fatal, Error |
   | `2` or `WARNING`   | Internal, Fatal, Error, Warning |
   | `3` or `ATTENTION` | Internal, Fatal, Error, Warning, Attention |
   | `4` or `INFO`      | Internal, Fatal, Error, Warning, Attention, Info |
   | `5` or `DEBUG`     | Internal, Fatal, Error, Warning, Attention, Info, Debug |
   | `6` or `TRACE`     | Internal, Fatal, Error, Warning, Attention, Info, Debug, Trace |
   | Anything else      | Internal, Fatal, Error, Warning, Attention, Info |
   
   For example, running your script via `VERBOSE=DEBUG ./yourScript` will activate also the debug level.

## Features planned to be added

 - [ ] Add command-line option to customize ar source time: 
    - [ ] Offer `fd` customization (now fd 3 is always used)
    - [ ] Offer label length customization (now fixed)
    - [ ] Offer level color customization (now fixed)
    - [ ] Offer date activation (now only the level label is printed)
 - [ ] Explore the possibility to implement a "level factory" to give possibility to the user to create their levels
 