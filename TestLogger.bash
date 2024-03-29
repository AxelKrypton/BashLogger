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

trap 'printf "\n"' EXIT
source Logger.bash "$@" || exit 1

Print_Trace              '\nTrace message '       --emph 'highlighted' ' VS normal'
Print_Debug              '\nDebug message '       --emph 'highlighted' ' VS normal'
Print_Info               '\nInformation message ' --emph 'highlighted' ' VS normal'
Print_Info               '\nTrailing' '--emph'
Print_Info               --emph '--emph'
Print_Info               --emph
Print_Info               ''
Print_Attention          '\n' 'Attention message '   --emph 'highlighted' ' VS normal'
Print_Warning            '\n' 'Warning message '     --emph 'highlighted' ' VS normal'
Print_Error              '\n' 'Error '               --emph 'highlighted' ' VS normal'
( Print_Fatal_And_Exit   '\n' 'Fatal error exit! '   --emph 'highlighted' ' VS normal' )
Print_Internal_And_Exit  '\n' 'Developer error '     --emph 'highlighted' ' VS normal'
