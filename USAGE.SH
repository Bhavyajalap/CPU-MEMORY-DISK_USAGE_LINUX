   #!/bin/bash

        # Set the duration of the script (in seconds)
        DURATION=60

        # Set the output file paths with timestamps
        DISK_OUTPUT="/home/kali/report/$(date +"%Y-%m-%d_%H-%M-%S_disk_usage.csv")"
        MEMORY_OUTPUT="/home/kali/report/$(date +"%Y-%m-%d_%H-%M-%S_memory_usage.csv")"
        CPU_OUTPUT="/home/kali/report/$(date +"%Y-%m-%d_%H-%M-%S_cpu_usage.csv")"

        # Print the headers of the CSV files
        echo "Timestamp,Total Disk Space (GB),Used Disk Space (GB),Free Disk Space (GB)" > "$DISK_OUTPUT"
        echo "Timestamp,Total Memory (MB),Used Memory (MB),Free Memory (MB)" > "$MEMORY_OUTPUT"
        echo "Timestamp,Core 1" > "$CPU_OUTPUT"


        # Loop for the duration of the script
        for ((i=0; i<$DURATION; i++)); do
                # Get disk usage information
                DISK_USAGE=$(df -h --output=size,used,avail / | tail -n 1 | awk '{print $1","$2","$3}')

                # Get memory usage information
                MEMORY_USAGE=$(free -m | awk 'NR==2 {print $2","$3","$4}')

                # Get cpu usage information
                CPU_USAGE=$(top -bn1 | grep "%Cpu" | awk '{print $2}' | paste -sd ",")

                # Get the current timestamp
                TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

                # Write disk usage to the CSV file
                echo "$TIMESTAMP,$DISK_USAGE" >> "$DISK_OUTPUT"

                # Write memory usage to the CSV file
                 echo "$TIMESTAMP,$MEMORY_USAGE" >> "$MEMORY_OUTPUT"

                # Write cpu usage to the CSV file
                echo "$TIMESTAMP,$CPU_USAGE" >> "$CPU_OUTPUT"

                # Wait for 1 second
                sleep 1
        done

        # Plot the disk usage graph using Python
        python3 python_disk.py "$DISK_OUTPUT"

        # Plot the memory usage graph using Python
        python3 python_memory.py "$MEMORY_OUTPUT"

        # Plot the CPU usage graph using Python
        python3 python_cpu.py "$CPU_OUTPUT"
