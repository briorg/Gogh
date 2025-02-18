#!/usr/bin/env bash

export PROFILE_NAME="Omni"

export COLOR_01="#191622"           # Black (Host)
export COLOR_02="#E96379"           # Red (Syntax string)
export COLOR_03="#67E480"           # Green (Command)
export COLOR_04="#E89E64"           # Yellow (Command second)
export COLOR_05="#78D1E1"           # Blue (Path)
export COLOR_06="#988BC7"           # Magenta (Syntax var)
export COLOR_07="#FF79C6"           # Cyan (Prompt)
export COLOR_08="#ABB2BF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#E96379"           # Bright Red (Command error)
export COLOR_11="#67E480"           # Bright Green (Exec)
export COLOR_12="#E89E64"           # Bright Yellow
export COLOR_13="#78D1E1"           # Bright Blue (Folder)
export COLOR_14="#988BC7"           # Bright Magenta
export COLOR_15="#FF79C6"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#191622"   # Background
export FOREGROUND_COLOR="#ABB2BF"   # Foreground (Text)

export CURSOR_COLOR="#ABB2BF" # Cursor

apply_theme() {
    if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
      bash "${GOGH_APPLY_SCRIPT}"
    elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
      bash "${PARENT_PATH}/apply-colors.sh"
    elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
      bash "${SCRIPT_PATH}/apply-colors.sh"
    else
      printf '\n%s\n' "Error: Couldn't find apply-colors.sh" 1>&2
      exit 1
    fi
}

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [ -z "${GOGH_NONINTERACTIVE+no}" ]; then
    apply_theme
else
    apply_theme 1>/dev/null
fi
