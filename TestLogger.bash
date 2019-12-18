#!/usr/bin/env bash
#
#  Copyright (c) 2019 Alessandro Sciarra <sciarra@itp.uni-frankfurt.de>
#
#  This file is part of BashLogger.
#
#  BashLogger is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  BashLogger is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with BashLogger. If not, see <https://www.gnu.org/licenses/>.
#

source Logger.bash

PrintTrace            "Trace message"
PrintDebug            "Debug message"
PrintInfo             "Information message"
PrintAttention        "Attention message"
PrintWarning          "Warning message"
PrintError            "Error"
( PrintFatalAndExit   "Fatal error, exit!" )
PrintInternalAndExit  "Internal, for developer error"
