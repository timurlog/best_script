#!/bin/bash
#
# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                        42 SCRIPT TOOLBOX - COMMON LIBRARY                    ║
# ║                                                                              ║
# ║  Shared functions, colors, and utilities for all toolbox scripts             ║
# ╚══════════════════════════════════════════════════════════════════════════════╝
#
# Usage: source "$SCRIPT_DIR/common.sh"

set -euo pipefail

# ─────────────────────────────────────────────────────────────────────────────────
# COLORS
# ─────────────────────────────────────────────────────────────────────────────────

export C_RESET="\033[0m"
export C_BOLD="\033[1m"
export C_DIM="\033[2m"

export C_RED="\033[38;5;196m"
export C_GREEN="\033[38;5;82m"
export C_YELLOW="\033[38;5;220m"
export C_BLUE="\033[38;5;39m"
export C_MAGENTA="\033[38;5;201m"
export C_CYAN="\033[38;5;51m"
export C_WHITE="\033[38;5;255m"
export C_GRAY="\033[38;5;245m"
export C_ORANGE="\033[38;5;208m"
export C_PURPLE="\033[38;5;141m"

# ─────────────────────────────────────────────────────────────────────────────────
# SYMBOLS
# ─────────────────────────────────────────────────────────────────────────────────

export S_CHECK="✓"
export S_CROSS="✗"
export S_ARROW="→"
export S_DOT="•"
export S_STAR="★"
export S_GEAR="⚙"
export S_FOLDER="📁"
export S_FILE="📄"
export S_ROCKET="🚀"
export S_WARN="⚠"
export S_LINK="🔗"
export S_BOOK="📚"
export S_LOCK="🔒"
export S_KEY="🔑"
export S_PACKAGE="📦"
export S_HAMMER="🔨"
export S_SPARKLE="✨"
export S_FIRE="🔥"

# ─────────────────────────────────────────────────────────────────────────────────
# LOGGING FUNCTIONS
# ─────────────────────────────────────────────────────────────────────────────────

log_info() {
    echo -e "  ${C_CYAN}${S_DOT}${C_RESET} ${C_WHITE}$1${C_RESET}"
}

log_success() {
    echo -e "  ${C_GREEN}${S_CHECK}${C_RESET} ${C_WHITE}$1${C_RESET}"
}

log_warning() {
    echo -e "  ${C_ORANGE}${S_WARN}${C_RESET} ${C_YELLOW}$1${C_RESET}"
}

log_error() {
    echo -e "  ${C_RED}${S_CROSS}${C_RESET} ${C_RED}$1${C_RESET}"
}

log_step() {
    echo -e "\n  ${C_MAGENTA}${S_GEAR}${C_RESET} ${C_BOLD}$1${C_RESET}"
}

log_dim() {
    echo -e "    ${C_GRAY}${C_DIM}$1${C_RESET}"
}

log_title() {
    echo -e "\n  ${C_CYAN}${C_BOLD}$1${C_RESET}"
}

# ─────────────────────────────────────────────────────────────────────────────────
# DIVIDERS
# ─────────────────────────────────────────────────────────────────────────────────

divider() {
    echo -e "  ${C_DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${C_RESET}"
}

divider_light() {
    echo -e "  ${C_DIM}─────────────────────────────────────────────────────────${C_RESET}"
}

# ─────────────────────────────────────────────────────────────────────────────────
# INPUT FUNCTIONS
# ─────────────────────────────────────────────────────────────────────────────────

# Ask yes/no question with optional default
# Usage: ask_yes_no "Question?" [y|n]
ask_yes_no() {
    local prompt="$1"
    local default="${2:-}"
    local answer

    while true; do
        echo -ne "  ${C_YELLOW}?${C_RESET} ${prompt} "
        if [[ "$default" == "y" ]]; then
            echo -ne "${C_DIM}[Y/n]${C_RESET} "
        elif [[ "$default" == "n" ]]; then
            echo -ne "${C_DIM}[y/N]${C_RESET} "
        else
            echo -ne "${C_DIM}[y/n]${C_RESET} "
        fi
        
        read -r answer || { log_error "Failed to read input."; return 2; }
        
        [[ -z "$answer" && -n "$default" ]] && answer="$default"
        
        case "${answer,,}" in
            y|yes) return 0 ;;
            n|no)  return 1 ;;
            *)     log_warning "Please enter 'y' or 'n'" ;;
        esac
    done
}

# Read input with validation
# Usage: read_input "Prompt" variable_name [icon]
read_input() {
    local prompt="$1"
    local var_name="$2"
    local icon="${3:-$S_ARROW}"
    local value=""

    while true; do
        echo -ne "  ${C_CYAN}${icon}${C_RESET} ${prompt}: ${C_BOLD}"
        read -r value || { echo -e "${C_RESET}"; log_error "Failed to read input."; return 1; }
        echo -ne "${C_RESET}"
        
        if [[ -n "${value// }" ]]; then
            eval "$var_name='$value'"
            return 0
        fi
        log_warning "This field cannot be empty."
    done
}

# Read input with default value
# Usage: read_input_default "Prompt" variable_name "default_value" [icon]
read_input_default() {
    local prompt="$1"
    local var_name="$2"
    local default="$3"
    local icon="${4:-$S_ARROW}"
    local value=""

    echo -ne "  ${C_CYAN}${icon}${C_RESET} ${prompt} ${C_DIM}[${default}]${C_RESET}: ${C_BOLD}"
    read -r value || { echo -e "${C_RESET}"; log_error "Failed to read input."; return 1; }
    echo -ne "${C_RESET}"
    
    if [[ -z "${value// }" ]]; then
        value="$default"
    fi
    eval "$var_name='$value'"
    return 0
}

# Select from options
# Usage: select_option "Prompt" variable_name "opt1" "opt2" ...
select_option() {
    local prompt="$1"
    local var_name="$2"
    shift 2
    local options=("$@")
    local count=${#options[@]}
    
    echo -e "  ${C_YELLOW}?${C_RESET} ${prompt}"
    
    local i=1
    for opt in "${options[@]}"; do
        echo -e "    ${C_CYAN}${i})${C_RESET} ${opt}"
        ((i++))
    done
    
    while true; do
        echo -ne "  ${C_CYAN}${S_ARROW}${C_RESET} Choice ${C_DIM}[1-${count}]${C_RESET}: ${C_BOLD}"
        read -r choice || { echo -e "${C_RESET}"; return 1; }
        echo -ne "${C_RESET}"
        
        if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= count )); then
            eval "$var_name='${options[$((choice-1))]}'"
            return 0
        fi
        log_warning "Please enter a number between 1 and ${count}"
    done
}

# ─────────────────────────────────────────────────────────────────────────────────
# UTILITY FUNCTIONS
# ─────────────────────────────────────────────────────────────────────────────────

# Spinner animation
# Usage: long_command & spinner $! "Message"
spinner() {
    local pid=$1
    local message=$2
    local spin_chars='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0

    while kill -0 "$pid" 2>/dev/null; do
        printf "\r  ${C_CYAN}%s${C_RESET} %s" "${spin_chars:i++%${#spin_chars}:1}" "$message"
        sleep 0.1
    done
    printf "\r%*s\r" $((${#message} + 5)) ""
}

# Progress bar (for known iterations)
# Usage: progress_bar current total "message"
progress_bar() {
    local current=$1
    local total=$2
    local message="${3:-}"
    local width=30
    local percent=$((current * 100 / total))
    local filled=$((current * width / total))
    local empty=$((width - filled))
    
    printf "\r  ${C_CYAN}[${C_GREEN}%*s${C_GRAY}%*s${C_CYAN}]${C_RESET} %3d%% %s" \
        "$filled" "" "$empty" "" "$percent" "$message" | tr ' ' '█' | sed 's/█/ /g'
    
    [[ $current -eq $total ]] && echo ""
}

# Check if command exists
# Usage: cmd_exists git && echo "git found"
cmd_exists() {
    command -v "$1" &>/dev/null
}

# Require command or exit
# Usage: require_cmd git "Please install git"
require_cmd() {
    local cmd="$1"
    local msg="${2:-$cmd is required}"
    
    if ! cmd_exists "$cmd"; then
        log_error "$msg"
        exit 1
    fi
}

# Check if file exists
# Usage: require_file "path/to/file" "description"
require_file() {
    local file="$1"
    local desc="${2:-$file}"
    
    if [[ ! -f "$file" ]]; then
        log_error "Required file not found: ${desc}"
        return 1
    fi
    return 0
}

# Get project name from current directory
get_project_name() {
    basename "$(pwd)"
}

# Get script directory (works when sourced)
get_script_dir() {
    local source="${BASH_SOURCE[1]:-${BASH_SOURCE[0]}}"
    dirname "$(realpath "$source")"
}

# Cleanup trap helper
# Usage: setup_cleanup "$TEMP_DIR"
setup_cleanup() {
    local dir="$1"
    trap "rm -rf '$dir'" EXIT
}

# ─────────────────────────────────────────────────────────────────────────────────
# GIT HELPERS
# ─────────────────────────────────────────────────────────────────────────────────

# Check if in git repo
is_git_repo() {
    git rev-parse --is-inside-work-tree &>/dev/null
}

# Get current branch
git_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Get short commit hash
git_hash() {
    git rev-parse --short HEAD 2>/dev/null
}

# Clone with spinner
# Usage: git_clone_spinner "url" "destination"
git_clone_spinner() {
    local url="$1"
    local dest="$2"
    
    git clone --recursive "$url" "$dest" > /dev/null 2>&1 &
    local pid=$!
    spinner $pid "Cloning repository..."
    wait $pid
}

# ─────────────────────────────────────────────────────────────────────────────────
# ENVIRONMENT HELPERS
# ─────────────────────────────────────────────────────────────────────────────────

# Get user with fallback
get_user() {
    echo "${USER:-$(whoami)}"
}

# Get mail with optional prompt
get_mail() {
    local mail="${MAIL:-}"
    
    if [[ -z "$mail" ]]; then
        read_input "Enter your 42 email" mail "📧"
    fi
    echo "$mail"
}

# Get current date formatted
get_date() {
    date +"%Y/%m/%d %H:%M:%S"
}

# ─────────────────────────────────────────────────────────────────────────────────
# BANNER HELPER
# ─────────────────────────────────────────────────────────────────────────────────

# Mini banner for sub-scripts
mini_banner() {
    local title="$1"
    local icon="${2:-$S_GEAR}"
    
    echo ""
    echo -e "  ${C_CYAN}${C_BOLD}${icon} ${title}${C_RESET}"
    divider_light
}
