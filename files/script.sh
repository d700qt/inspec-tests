#!/bin/bash

# Set the maximum number of retries
max_retries=2

# Set the wait time (in seconds) between retries
wait_time=2

# Your command goes here
your_command='ls /root -l | wc -l | tr -d "\\\\n"'

# Retry loop
for ((i = 1; i <= max_retries; i++)); do
    # Execute the command
    eval $your_command
    return_code=$?
    echo "return code: $return_code"

    # Check the exit status
    if [ $return_code -eq 0 ]; then
        echo "Command succeeded!"
        exit 0
    else
        echo "Command failed. Retrying in $wait_time seconds..."
        sleep $wait_time
    fi
done
exit 1