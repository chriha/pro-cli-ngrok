#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # #
# show ngrok commands help if local config file exists
if [ -f "$PROJECT_CONFIG" ]; then
    printf "NGROK COMMANDS:\n"
    printf "    ${BLUE}expose${NORMAL}${HELP_SPACE:6}Temporarily expose the application (ngrok required).\n"
fi
