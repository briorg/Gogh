#!/usr/bin/env bash

export PROFILE_NAME="Chameleon"

export COLOR_01="#2C2C2C"           # Black (Host)
export COLOR_02="#CC231C"           # Red (Syntax string)
export COLOR_03="#689D69"           # Green (Command)
export COLOR_04="#D79922"           # Yellow (Command second)
export COLOR_05="#366B71"           # Blue (Path)
export COLOR_06="#4E5165"           # Magenta (Syntax var)
export COLOR_07="#458587"           # Cyan (Prompt)
export COLOR_08="#C8BB97"           # White

export COLOR_09="#777777"           # Bright Black
export COLOR_10="#CC231C"           # Bright Red (Command error)
export COLOR_11="#689D69"           # Bright Green (Exec)
export COLOR_12="#D79922"           # Bright Yellow
export COLOR_13="#366B71"           # Bright Blue (Folder)
export COLOR_14="#4E5165"           # Bright Magenta
export COLOR_15="#458587"           # Bright Cyan
export COLOR_16="#C8BB97"           # Bright White

export BACKGROUND_COLOR="#2C2C2C"   # Background
export FOREGROUND_COLOR="#DEDEDE"   # Foreground (Text)

export CURSOR_COLOR="#DEDEDE" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
  bash "${GOGH_APPLY_SCRIPT}"
elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
  bash "${SCRIPT_PATH}/apply-colors.sh"
else
  printf '\n%s\n' "Error: Couldn't find apply-colors.sh"
  exit 1
fi
