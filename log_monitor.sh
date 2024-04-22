#!/bin/bash

# Specify the log file you want to monitor
LOG_FILE="C:\Users\Lenovo\Krishna\file.log"

# Function to check for new entries in the log file
check_log() {
    # Get the current size of the log file
    current_size=$(wc -c < "$LOG_FILE")
    
    # If the log file has grown, there are new entries
    if [ "$current_size" -gt "$previous_size" ]; then
        # Display new entries
        echo "New entries detected:"
        tail -c +"$previous_size" "$LOG_FILE"
        
        # Update the previous size
        previous_size="$current_size"
    fi
}

# Initialize the previous size
previous_size=$(wc -c < "$LOG_FILE")

# Continuous monitoring loop
while true; do
    # Check for new entries
    check_log
    # Wait for a second before re-checking
    sleep 1
done

