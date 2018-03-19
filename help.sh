#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # #
# show docker commands help if local config file exists
if [ -f "$WDIR/docker-compose.yml" ]; then
    printf "NGROK COMMANDS:\n"
    printf "    ${BLUE}expose${NORMAL}${HELP_SPACE:6}Temporarily expose the application (ngrok required).\n"
fi
