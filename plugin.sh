#!/usr/bin/env bash

if [ "$1" == "expose" ]; then
    if [ "$2" == "-h" ] || [ "$2" == "--help" ]; then
        printf "${YELLOW}usage:${NORMAL} project expose [options]\n\n"
        printf "OPTIONS:\n"
        printf "    ${BLUE}--auth='user:password'${NORMAL}${HELP_SPACE:22}Secure the application with basic auth.${NORMAL}\n"
        exit
    fi

    if ! ngrok -v &> /dev/null; then
        printf "${RED}No ngrok installed.${NORMAL} Please go to https://ngrok.com/ and install the latest version.\n"
        exit
    fi

    if [[ ! -f "$WDIR/.env" ]]; then
        printf "${RED}.env is missing.${NORMAL} Are you inside of a project?\n"
        exit
    fi

    PORT=$(cat "$WDIR/.env" | grep APP_PORT | sed -e 's/APP_PORT=\(.*\)/\1/')

    if [[ -z "$PORT" ]]; then
        printf "${YELLOW}No port specified in .env${NORMAL}\n"
        exit
    fi

    shift

    project up
    ngrok http $PORT $@
    exit
fi