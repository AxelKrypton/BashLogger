# Changelog

All notable changes to the `BashLogger` will be documented in this file.

Strictly speaking, this project does not adhere to [Semantic Versioning](http://semver.org/spec/v2.0.0.html), but it follows some aspects inspired from it.
In particular, given a version number `X.Y`,
 - `Y` is incremented for minor changes (e.g. bug fixes) and minor new features and
 - `X` for major ones.

In this project, version `1.0` is considered to be reached when the logger starts to be _complete_ in view of the developers.
Any of the releases before is stable and usable, though.

### Legend

 * :new: New feature
 * :white_check_mark: Enhancement
 * :sos: Bug fix
 * :x: Removed feature

---

## [Unreleased]

 * :white_check_mark: Use 9 as default output file descriptor (as Bash discourages larger ones)

---

## [Version 0.2] &nbsp;&nbsp; <sub><sup>23 June 2023</sub></sup>

* :white_check_mark: Provide additional user interface with `_`-separated words in function names (instead of camel-case)
* :new: Implement mechanism to emphasize part of the message
* :new: Allow user to choose the default exit code to be used from the logger for fatal errors
* :new: Allow user to choose at source time the output file descriptor to be used
* :sos: Fix logger to be used when bash `-u` option is activated

---

## [Version 0.1] &nbsp;&nbsp; <sub><sup>19 December 2019</sub></sup>

This has been the first release of the repository.


[Unreleased]: https://github.com/AxelKrypton/BashLogger/compare/v0.2...HEAD
[Version 0.2]: https://github.com/AxelKrypton/BashLogger/releases/tag/v0.2
[Version 0.1]: https://github.com/AxelKrypton/BashLogger/releases/tag/v0.1
