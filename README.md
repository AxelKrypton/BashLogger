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

If you want simply try it out, you can clone this repository and run the `TestLogger.bash` script as such, or prepending `VERBOSE=TRACE` to activate all levels of output (or something according to the table below).

If you plan to include the logger in your project, feel free to do so.
It should be enough to add the `Logger.bash` file to your codebase.
In any case, please,
* give credit to the author e.g. in the `README` of your repository;
* leave the license and copyright notice in the `Logger.bash` file, although you might prepend there the header of your codebase.

---

### Instructions for the user

This logger has been implemented with the aim to provide functionality once sourced in another script.
Therefore, it simply contains a bunch of functions which become available into your script, once the logger has been sourced.
By default, errors messages (`ERROR`, `FATAL` and `INTERNAL`) are printed to standard error, while the other ones to a customizable file descriptor.

1. Source the logger in your script via `source /path/to/Logger.bash [OPTIONS...]`.
   #### Available options at source time:

   **`--fd N`**  
   Use `N` as logger output file descriptor, with `0<N<255` (default: `N=9`).

   **`--default-exit-code N`**  
   Use `N` as default exit code for `FATAL` and `INTERNAL`, with `0≤N≤255` (default: `N=1`). The `exit_code` variable can be used to change this either globally or on a per-case basis (see below).
1. Use either of the provided functions when you wish to print something to the user:
   * `PrintTrace` or `Print_Trace`
   * `PrintDebug` or `Print_Debug`
   * `PrintInfo` or `Print_Info`
   * `PrintAttention` or `Print_Attention`
   * `PrintWarning` or `Print_Warning`
   * `PrintError` or `Print_Error`
   * `PrintFatalAndExit` or `Print_Fatal_And_Exit`
   * `PrintInternalAndExit` or `Print_Internal_And_Exit`
   
   Note that either of the two syntaxes produces identical results and the reason both are provided is that then you might pick up that with a name closer to the convention used in your codebase.
1. Each function must be followed by at least one argument (possibly empty, but not made of '\n' only).
   Each argument is printed on a new line, prepending the level label to the first argument and just spaces to the following ones.
   Any argument can be prepended by `--emph` and this makes the following string be emphasized, i.e. printed in a standing out color (run the `TestLogger.bash` script to get an example).
   Note that a trailing `--emph` argument will be printed literally in the default level color, as well as if `--emph` is given twice in a row (this time is printed in the emphasized color).

   Each argument is printed to the chosen fd (which duplicates the standard output when the logger is sourced).
   **This means that you can use the logger in a function and still capture its standard output via the `$(call_to_function)` syntax.**
   This works because command expansion `$()` captures the standard output only!
1. By default, both `PrintFatalAndExit` and `PrintInternalAndExit` will exit with exit code 1 (general failure).
   You can however use the `exit_code` variable to change this either globally or on a per-case basis.
   E.g. `exit_code=42 PrintFatalAndExit "Oh no!"` will use 42 as exit code (and the `exit_code` variable will not be changed in the calling environment).
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

 - [x] Implement mechanism to highlight part of message
 - [ ] Add command-line option to customize at source time:
    - [x] Offer `fd` customization
    - [x] Offer default exit code customization
    - [ ] Offer label length customization (now fixed)
    - [ ] Offer level color customization (now fixed)
    - [ ] Offer date activation (now only the level label is printed)
 - [ ] Allow literal `--` to be used and be printed (now it separates options from strings)
 - [ ] Explore the possibility to implement a "level factory" to give possibility to the user to create their levels
 
## A similar logger in C++

The idea to implement this logger in this way came to my mind from the fact that I already sometimes use a similar tool in `C++` codebases, which is called **Einhard** and which is [freely available](https://gitlab.com/Marix/Einhard).
Check it out!
