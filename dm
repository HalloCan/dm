#!/bin/bash
#--------------------------#
#    Code by HalloCandy    #
#     At Sep. 3rd 2024     #
#       Version 1.00       #
#  2024 HToC Open-sourced  #
#--------------------------#

echo "Hello DOCKER!"

if [ "$(whoami)" != "root" ]; then
    echo "This script needs root privileges. Try 'sudo $0' again."
    exit 1
fi

isdocker=$(whereis docker)
if [ ${#isdocker} -lt 12 ]; then
    echo "Docker is not installed!"
    exit 1
fi

docker_version=$(docker --version | cut -c 8-)
echo 'Your Docker Version is '"$docker_version".

function stop_all() {
    running_containers=$(docker container ls -q)
    if [ -z "$running_containers" ]; then
        echo "No containers are running."
    else
        docker stop "$running_containers"
    fi
}

function show_all() {
    docker container ls -a
}

function show_running() {
    docker container ls
}

function run() {
    echo "Containers:"
    docker ps -a --format "table {{.Names}}" | grep -v "NAMES" | cat -n
    echo "Which?"
    read -r b
    docker start "$(docker ps -a --format "table {{.Names}}" | grep -v "NAMES" | sed -n "${b}p")"
}

function stop() {
    running_containers=$(docker container ls -q)
    if [ -z "$running_containers" ]; then
        echo "No containers are running."
    else
        echo "Containers:"
        docker ps --format "table {{.Names}}" | grep -v "NAMES" | cat -n
        echo "Which?"
        read -r b
        docker stop "$(docker ps -a --format "table {{.Names}}" | grep -v "NAMES" | sed -n "${b}p")"
    fi
}

function selects() {
    while true; do
        echo " "
        echo " "
    	echo "*******************************"
        echo "1: Stop all containers"
        echo "2: Show all existing containers"
        echo "3: Show all running containers"
        echo "4: Start container"
        echo "5: Stop a specific container"
        echo "6: Exit"
    	echo "*******************************"
        read -r choose

        case $choose in
            1)
                stop_all
                ;;
            2)
                show_all
                ;;
            3)
                show_running
                ;;
            4)
                run
                ;;
            5)
                stop
                ;;
            6)
                echo "Exiting...Bye"
                exit 0
                ;;
            *)
                echo "Invalid option, please choose again."
                ;;
        esac
    done
}

if [ "$1" ]; then
    case $1 in
        -sa)
            stop_all
            ;;
        -r)
            if [ "$2" ]; then
                docker start "$2"
            else
                echo "Container name is required."
            fi
            ;;
        -s)
            stop
            ;;
        -h)
            echo "-sa: Stop all containers"
            echo "-s : Stop container"
            echo "-r <container_name>: Run <container_name>"
            ;;
        *)
            echo "-sa: Stop all containers"
            echo "-s : Stop container"
            echo "-r <container_name>: Run <container_name>"
            ;;
    esac
else
    selects
fi

