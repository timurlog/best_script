#!/bin/bash

# Define color codes for output messages
YELLOW="\033[1;33m"
RED="\033[0;91m"
GREEN="\033[1;32m"
BLUE="\033[0;94m"
MAGENTA="\033[0;95m"
RESET="\033[0m"

# Define variables for repository URL, temporary directory, installation directory
REPO_URL="${LIBFT_REPO_URL:-}"
TEMP_DIR="$HOME/temp_____"
PROJECT_DIR="$(pwd)"
INSTALL_DIR="$PROJECT_DIR"

# Check if REPO_URL is set
if [[ -z "$REPO_URL" ]]; then
    echo -e "${RED}LIBFT_REPO_URL is not set. Please set it in your environment.${RESET}"
    echo -e "${YELLOW}Example: export LIBFT_REPO_URL=\"git@github.com:user/libft.git\"${RESET}"
    exit 1
fi

# Ensure the temporary directory is removed on script exit
trap 'rm -rf "$TEMP_DIR"' EXIT

# Prepare for installation by cleaning up and creating a temporary directory
echo -e "${YELLOW}Preparing the libft installation...${RESET}"
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR" || { echo -e "${RED}Failed to create the temporary directory.${RESET}"; exit 1; }

# Clone the repository into the temporary directory
echo -e "${YELLOW}Cloning the libft repository...${RESET}"
git clone --recursive "$REPO_URL" "$TEMP_DIR/libft" > /dev/null 2>&1 || { echo -e "${RED}Failed to clone the repository.${RESET}"; exit 1; }

# Copy the cloned files to the installation directory
echo -e "${YELLOW}Copying files...${RESET}"
cp -r "$TEMP_DIR/libft"/* "$INSTALL_DIR" || { echo -e "${RED}Failed to copy files.${RESET}"; exit 1; }

# Display a success message
echo -e "${GREEN}Libft installation completed successfully${RESET}"
