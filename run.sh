#!/bin/bash

set -e
#set -x - DEBUG
VERSION=0.1.0
NAME="CLI Helper"

DOCKER_COMPOSE_FILES_PATH=docker_compose_files

# =========================================================================== #
# Prompt Introduction
# =========================================================================== #
LINE_BREAK="#==============================================================#\n"
bold_green_prefix="\033[1;32m"
bold_green_suffix="\033[00m"
bold_yellow_prefix="\033[1;33m"
bold_yellow_suffix="\033[00m"
yellow_prefix="\033[33m"
yellow_suffix="\033[00m"
red_prefix="\033[31m"
red_suffix="\033[00m"

greet() {
    # ======================================================================= #
    # Prompt Introduction
    # ======================================================================= #
    printf $LINE_BREAK
    echo -e "$bold_green_prefix"Hello "$(whoami)","$bold_green_suffix"
    echo "Welcome to $NAME, version $VERSION"
    printf $LINE_BREAK
    printf "\n"
}

prompt_help() {
    echo "Commands:"
    echo "- help: promp command options"
    echo "- up: docker-compose up"
    printf "\n"
}

run_cli() {
    # Run CLI
    greet
    prompt_help

    while true; do
        read -p "$(echo -e $bold_yellow_prefix"Waiting command: "$bold_yellow_suffix)" cmd
        printf "\n"
        # =================================================================== #
        # Clean app data
        # =================================================================== #
        if [ $cmd == "help" ];
            then
                prompt_help
        elif [ $cmd == "up" ];
            then
                compose_files_counter=0
                declare -A compose_files_dict
                for entry in "$DOCKER_COMPOSE_FILES_PATH"/*
                do
                let "compose_files_counter+=1"
                compose_files_dict["$compose_files_counter"]="$entry"
                echo "$compose_files_counter - $entry"
                done
                printf "\n"
                read -p "Choose compose: " compose_number
                # Back to main menu
                if [ $compose_number == "exit" ];
                    then
                        clear
                else
                    #  Run compose
                    MYUID="$(id -u)" \
                    MYGID="$(id -g)" \
                    docker-compose -f "${compose_files_dict[$compose_number]}" up -d

                fi
        elif [ $cmd == "clear" ];
            then
                clear

        elif [ $cmd == "exit" ];
            then
                exit

        # =================================================================== #
        # Unreckognized command
        # =================================================================== #
        else
            echo -e "$red_prefix"Unreckognized arg, try again..."$red_suffix"
        fi
    done
}

run_cli