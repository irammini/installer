#!/bin/bash

# Define repo context
USER="irammini"
REPO="installer"
BRANCH="main"

# The core logic
TOOL_NAME=$1
RAW_URL="https://raw.githubusercontent.com/${USER}/${REPO}/${BRANCH}/scripts/${TOOL_NAME}.sh"

# Execution (Example: check and run)
if curl --output /dev/null --silent --head --fail "$RAW_URL"; then
    curl -fsSL "$RAW_URL" | bash
else
    echo "Error: Tool '${TOOL_NAME}' not found at ${RAW_URL}"
    exit 1
fi